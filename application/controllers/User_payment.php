<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class User_payment extends MY_Controller {
	public function __construct(){
		parent::__construct();
		$this->load->library('cart');
        check_info();
        $this->security->pay_in_cash();
        if(d_auth('is_discount')==TRUE){
            $this->coupon_id = !empty(d_auth('coupon_id'))?d_auth('coupon_id'):0;
        }else{
            $this->coupon_id = 0;
        }
	}

    /*----------------------------------------------
        START RAZOPRPAY PAYMENT
    ----------------------------------------------*/
public function razorpay_payment(){
        $statusMsg = '';
        $data = array();
    if (!empty($this->input->post('razorpay_payment_id'))) {

        //get payment data from paypal url
        $payment_id = $this->input->post('razorpay_payment_id');
        $slug = $this->input->post('username');
        $settings = settings();
        $u_info = $this->admin_m->get_restaurant_info_slug($slug); //get user info by id from paypal url
        $id = get_id_by_slug($slug);
        $data['id']=$id;
        if(empty($id)){
            redirect(base_url('error-404'));
        }
        $payment = auth('payment');
        $amount = $this->input->post('totalAmount');
        $total_price = $amount/100;

        $razorpay = json_decode($u_info['razorpay_config'],TRUE);

        $keys = array(
            'key_id' => $razorpay['razorpay_key_id'],
            'secret_key' => $razorpay['razorpay_key'],
        );


        $data = array(
            'amount' => round($amount),
            'currency' => $u_info['currency_code'],
        );

        $success = false;
        $error = '';
        $status = '';

        try {                
            $ch = $this->curl_handler($payment_id, $data,$keys);
                    //execute post
            $result = curl_exec($ch);

            $http_status = curl_getinfo($ch, CURLINFO_HTTP_CODE);

            if ($result === false) {
                $success = false;
                $msg = 'Curl error: '.curl_error($ch);
                 echo json_encode(['st'=>0,'msg'=>$msg]);
            } else {
                $response_array = json_decode($result, true);
                            //Check success response
                if ($http_status === 200 and isset($response_array['error']) === false) {
                    $success = true;
                    $status = $response_array['status'];
                } else {
                    $success = false;
                    $status = $response_array['status'];
                    if (!empty($response_array['error']['code'])) {
                        $msg = $response_array['error']['code'].':'.$response_array['error']['description'];
                    } else {
                        $msg = 'RAZORPAY_ERROR:Invalid Response <br/>'.$result;
                    }
                     echo json_encode(['st'=>0,'msg'=>$msg]);
                }
            }
                    //close curl connection
            curl_close($ch);
        } catch (Exception $e) {
            $success = false;
            $msg = 'Request to Razorpay Failed';
            echo json_encode(['st'=>0,'msg'=>$msg]);
        }


        if ($success === true) {
            $data_info = array(
                'user_id' => $u_info['user_id'],
                'order_id' =>$payment['uid'],
                'shop_id' =>$payment['shop_id'],
                'order_type' =>$payment['order_type'],
                'price' => $total_price,
                'currency_code' => 'INR',
                'status' => strtolower(!empty($status)?$status:'authorized'),
                'txn_id' => $payment_id,
                'payment_by' => 'razorpay',
                'created_at' => d_time(),
            );
           
            $insert = $this->common_m->insert($data_info,'order_payment_info');

            if($insert):
                $data['url'] = base_url('user_payment/payment_success/'.$slug.'?txn_id='.$payment_id).'&method=razorpay&amount='.$total_price;

                $data['status'] = 1;
                $data['msg'] = 'Payment Successfull';
            else:
                $data['msg'] = 'Paypal Payment failed';
                $data['status'] = 0;
            endif;
             
            echo json_encode($data);

        } else {
            $msg = 'Payment Canceled';
            echo json_encode(['st'=>0,'msg'=>$msg]);
        } //success === true


    }else{
       $msg = 'An error occured. Contact site administrator, please!';
       echo json_encode(['st'=>0,'msg'=>$msg]);
    }
}

    private function curl_handler($payment_id, $data, $keys)  {
        $url            = 'https://api.razorpay.com/v1/payments/'.$payment_id.'/capture';
        $key_id         = $keys['key_id'];
        $key_secret     = $keys['secret_key'];
        $params = http_build_query($data);
        // $params = http_build_query($data);
                //cURL Request
        $ch = curl_init();
                //set the url, number of POST vars, POST data
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_USERPWD, $key_id.':'.$key_secret);
        curl_setopt($ch, CURLOPT_TIMEOUT, 60);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $params);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, true);
        return $ch;
    }  

    /*----------------------------------------------
        END RAZOPRPAY PAYMENT
    ----------------------------------------------*/










// Payment succes 
	function paypal($slug){
        $data = array();
     	//get payment data from paypal url
     	$paypalInfo = $this->input->get();
        $settings = settings();
        $u_info = $this->admin_m->get_restaurant_info_slug($slug); //get user info by id from paypal url
        $id = get_id_by_slug($slug);
		$data['id']=$id;
        if(empty($id)){
        	redirect(base_url('error-404'));
        }
        

        $payment = auth('payment');
        $data_info = array(
        	'user_id' => $u_info['user_id'],
        	'order_id' =>$payment['uid'],
        	'shop_id' =>$payment['shop_id'],
            'order_type' =>$payment['order_type'],
        	'price' => $paypalInfo["amt"],
        	'currency_code' => $paypalInfo["cc"],
        	'status' => $paypalInfo["st"],
        	'txn_id' => $paypalInfo["tx"],
            'payment_by' => 'paypal',
        	'created_at' => d_time(),
        );
        $insert = $this->common_m->insert($data_info,'order_payment_info');
        
        if($insert):
			$total_price = $payment['total']; 

            if($total_price = $paypalInfo["amt"] && $paypalInfo["st"] == 'Completed'){

            	redirect(base_url('user_payment/payment_success/'.$slug.'?txn_id='.$paypalInfo["tx"]).'&method=paypal&amount='.$paypalInfo["amt"]);
            	
            }else{
            	$data['msg'] = 'Paypal Payment failed';
            	$data['status'] = 0;

                redirect(base_url('user_payment/payment_cancel/'.$slug));
            }
        else:
            redirect(base_url('user_payment/payment_cancel/'.$slug));
        endif;
        //pass the transaction data to view
     }


/*----------------------------------------------
Payment success
----------------------------------------------*/
     public function payment_success($slug){
        $data= [];
        $settings = settings();
        $u_info = $this->admin_m->get_restaurant_info_slug($slug); //get user info by id from paypal url
        $id = get_id_by_slug($slug);
        $data['id']=$id;
        $data['slug']=$slug;

        if(empty($id)){
            redirect(base_url('error-404'));
        }

        $payment = auth('payment');
        $total_price = $payment['total']; 
        $data = array(
            'uid' => $payment['uid'],
            'name' => $payment['name'],
            'email' => $payment['email'],
            'phone' => $payment['phone'],
            'customer_id' => $payment['customer_id'],
            'address' => $payment['address'],
            'delivery_area' => $payment['delivery_area'],
            'order_type' => $payment['order_type'],
            'total_person' => isset($payment['total_person'])?$payment['total_person']:0,
            'table_no' => isset($payment['table_no'])?$payment['table_no']:0,
            'reservation_date' => $payment['reservation_date'],
            'pickup_time' => $payment['pickup_time'],
            'pickup_date' => $payment['pickup_date'],
            'shop_id' => $payment['shop_id'],
            'delivery_charge' => $payment['delivery_charge'],
            'shipping_id' => $payment['shipping_id'],
            'is_ring' => 1,
            'pickup_point' => $payment['pickup_point'],
            'total' => $total_price,
            'comments' =>$payment['comments'],
            'tax_fee' => $u_info['tax_fee'],
            'discount' => $u_info['discount'],
            'sub_total' => $payment['sub_total'],
            'is_coupon' => $payment['is_coupon'],
            'use_payment' =>$payment['use_payment'],
            'coupon_percent' => $payment['coupon_percent'],
            'tips' => $payment['tips'],
            'is_change' => $payment['is_change'],
            'change_amount' => $payment['change_amount'],
            'is_payment' => 1,
            'payment_by' => isset($_GET['method'])?$_GET['method']:'',
            'created_at' => d_time(),
        );
        $check = $this->common_m->check_order($payment['shop_id'],$payment['uid']);
        if($check['check']==0):

             $insert_order = $this->admin_m->insert($data,'order_user_list');
            if($insert_order):
                $info = $this->order_info($insert_order,$data);
                $data['txn_id'] = isset($_GET['txn_id'])?$_GET['txn_id']:0;
                $data['info'] = $info;
                $data['last_id'] = $insert_order;
                $data['order_id'] = $info['order_id'];
                if($this->coupon_id !=0){
                    $this->admin_m->update_discount($this->coupon_id);
                }

                 $order_slug = $this->common_m->single_select_by_id($payment['order_type'],'order_types')['slug'];

                if(shop($payment['shop_id'])->is_whatsapp ==1 && is_feature(shop($payment['shop_id'])->user_id,'whatsapp')==1):
                    $whatsappfor = !empty($u_info['whatsapp_enable_for'])?json_decode($u_info['whatsapp_enable_for'],true):"";
                    if(isset($whatsappfor[$order_slug]) && $whatsappfor[$order_slug]==1):
                        $data['is_whatsapp'] = 1;
                    else:
                        $data['is_whatsapp'] = 0;
                    endif;
                else:
                    $data['is_whatsapp'] = 0;
                endif;

            endif;
        else:

            $shop_id = $check['result']['shop_id'];
            $data['shop_id'] = $shop_id;
            $data['address'] = $check['result']['address'];
            $data['name'] = $check['result']['name'];
            $data['phone'] = $check['result']['phone'];
            $data['delivery_area'] = $check['result']['delivery_area'];
            $data['order_id'] = $check['result']['uid'];
            $data['shop_info'] = $this->common_m->get_restaurant_info_by_id($shop_id);
            $data['last_id'] = $check['result']['id'];


            $order_slug = $this->common_m->single_select_by_id($data['order_type'],'order_types')['slug'];

            if(shop($shop_id)->is_whatsapp ==1 && is_feature(shop($shop_id)->user_id,'whatsapp')==1):
                $whatsappfor = !empty($data['shop_info']['whatsapp_enable_for'])?json_decode($data['shop_info']['whatsapp_enable_for'],true):"";
                if(isset($whatsappfor[$order_slug]) && $whatsappfor[$order_slug]==1):
                    $data['is_whatsapp'] = 1;
                else:
                    $data['is_whatsapp'] = 0;
                endif;
            else:
                $data['is_whatsapp'] = 0;
            endif;

            $data['info'] = ['st'=>1,'msg'=>'','load_data'=>'','order_id'=>$check['result']['uid'],'qrlink'=>$check['result']['qr_link'],'last_id'=>$check['result']['id']];

            $data['txn_id'] = isset($_GET['txn_id'])?$_GET['txn_id']:0;
       
            
        endif;
        /*----------------------------------------------
            for banner and payment page
        ----------------------------------------------*/


       

        $data['id'] = $u_info['user_id'];
        $data['slug'] = $u_info['username'];
        $data['user'] = $this->admin_m->get_profile_info($id);
        $data['shop'] = $this->admin_m->get_restaurant_info($id);
        $data['shop_id'] = $data['shop']['id'];
        $data['social'] = json_decode($data['shop']['social_list'],TRUE);
        $data['status'] = 1;
        $data['msg'] = 'Paypal Payment Successfull';
        $data['main_content'] = $this->load->view('payment/payment_success', $data, TRUE);
        $this->load->view('payment_index',$data);

     }


    public function order_info($insert,$info){
        $data =[];
        $order_id = $info['uid'];
        $shop_id = $info['shop_id'];
        $order_type = $info['order_type'];
        $insertItem = $this->insert_order_item($insert);
        $data['shop_info'] = $this->common_m->get_restaurant_info_by_id($shop_id);
        if($insertItem==TRUE):
            $qrLink = $this->upload_m->order_qr($info['phone'],$order_id,$shop_id);
            $track_link = base_url('my-orders/'.$data['shop_info']['username'].'?phone='.$info['phone'].'&orderId='.$order_id);
            $msg = '<div class="alert alert-success alert-dismissible">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            <strong><i class="fas fa-frown"></i> Success! </strong> Order Confirm. Track you order using your phone number.
            <p>Your order number #'.$order_id.'</p>
            </div>';
        else:
            $msg = '<div class="alert alert-danger alert-dismissible">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            <strong><i class="fas fa-frown"></i> Sorry! </strong> Order not confirm please try again!
            </div>';
        endif;

        $data['order_id'] = $order_id;
        $data['order_type'] = $order_type;
        $data['total_price'] = $info['total'];
        $data['last_id'] = $insert;
        
         $order_slug = $this->common_m->single_select_by_id($data['order_type'],'order_types')['slug'];

            if(shop($shop_id)->is_whatsapp ==1 && is_feature(shop($shop_id)->user_id,'whatsapp')==1):
                $whatsappfor = !empty($data['shop_info']['whatsapp_enable_for'])?json_decode($data['shop_info']['whatsapp_enable_for'],true):"";
                if(isset($whatsappfor[$order_slug]) && $whatsappfor[$order_slug]==1):
                    $data['is_whatsapp'] = 1;
                else:
                    $data['is_whatsapp'] = 0;
                endif;
            else:
                $data['is_whatsapp'] = 0;
            endif;

        return ['st'=>1,'msg'=>$msg,'shop_id'=>$shop_id,'order_id'=>$order_id,'load_data'=>'','qrlink'=>$qrLink,'track_link'=>$track_link];
        
        $this->cart->destroy();


    }

    public function insert_order_item($insertId){
        $cartItems = $this->cart->contents();
            // Cart items
            $ordItemData = array();
            $i=0;
            foreach($cartItems as $item){
                if(isset($item['is_size']) && $item['is_size']==1){
                    $id = $item['item_id'];
                    $is_size = 1;
                    $size_slug = $item['sizes']['size_slug'];
                }else{
                    $id = $item['item_id'];
                    $is_size = 0;
                    $size_slug = '';
                }

                if(isset($item['is_extras']) && $item['is_extras']==1):
                    $is_extras = 1;
                    $extra_id = $item['extra_id'];
                else:
                    $is_extras = 0;
                    $extra_id = '';
                endif;

                $ordItemData[$i]['order_id']     = $insertId;
                $ordItemData[$i]['shop_id']     = $item['shop_id'];
                $ordItemData[$i]['item_id']     = $id;
                $ordItemData[$i]['qty']     = $item['qty'];
                $ordItemData[$i]['package_id']     = $item['is_package']==0?0:$item['id'];
                $ordItemData[$i]['is_package']     = $item['is_package'];
                $ordItemData[$i]['sub_total'] = $item["subtotal"];
                $ordItemData[$i]['item_price'] = $item["price"];
                $ordItemData[$i]['is_size'] = $is_size;
                $ordItemData[$i]['size_slug'] = $size_slug;
                $ordItemData[$i]['is_extras'] = $is_extras;
                $ordItemData[$i]['extra_id'] = $extra_id;
                $ordItemData[$i]['created_at'] = d_time();
                
                $check_settings = shop($item['shop_id'])->stock_status;

                if(isset($check_settings) && $check_settings==1):
                    if($item['is_package']==1):
                        $info = single_select_by_id($id,'item_packages');
                        $up_data = ['remaining' => $info['remaining']+$item['qty']];
                        $this->admin_m->update($up_data,$id,'item_packages');
                    else:
                        $info = single_select_by_id($id,'items');
                        $up_data = ['remaining' => $info['remaining']+$item['qty']];
                        $this->admin_m->update($up_data,$id,'items');
                    endif;
                endif;

                 $i++;
            }
            $insert = $this->admin_m->insert_all($ordItemData,'order_item_list');
            if($insert){
                return TRUE;
            }else{
                return FALSE;
            }

    }

    public function stripe_payment()
    {
        
        $data = array();   
        $statusMsg =''; 

        if(!empty($this->input->post('stripeToken'))) {                                                             
            $amount = $this->input->post('amount');
            $shop_id = $this->input->post('shop_id');
            $slug = $this->input->post('username');
            $name = $this->input->post('stripe_name');
            $email = $this->input->post('stripe_email');

            $u_info = $this->admin_m->get_restaurant_info_slug($slug); //get user info by id from paypal url
            $secret_key = json_decode($u_info['stripe_config']);
            $id = get_id_by_slug($slug);
            $data['id']=$id;
            if(empty($id)){
                redirect(base_url('error-404'));
            }


            $params = array(
                'amount' => $amount * 100,
                'currency' => $u_info['currency_code'],
                'description' => 'Charge for '.$slug.' Order',
                'source' => $this->input->post('stripeToken'),
                'metadata' => array( 
                'shop_id' => $shop_id,
                )
            );
            $jsonData = $this->get_curl_handle($params,$secret_key->secret_key);
            $resultJson = json_decode($jsonData, true);
            if($resultJson['amount_refunded'] == 0 && empty($resultJson['failure_code']) && $resultJson['paid'] == 1 && $resultJson['captured'] == 1){ 
                // Order details  
                $transactionID = $resultJson['balance_transaction']; 
                $currency = $resultJson['currency']; 
                $payment_status = $resultJson['status'];


             // If the order is successful 
            if($payment_status == 'succeeded') { 

                $payment = auth('payment');
                $total_price = $payment['total']; 
                $data_info = array(
                    'user_id' => $u_info['user_id'],
                    'order_id' =>$payment['uid'],
                    'shop_id' =>$payment['shop_id'],
                    'order_type' =>$payment['order_type'],
                    'price' => $total_price,
                    'currency_code' => $currency,
                    'status' => $payment_status,
                    'txn_id' => $transactionID,
                    'payment_by' => 'stripe',
                    'created_at' => d_time(),
                );
                $insert = $this->common_m->insert($data_info,'order_payment_info');

                if($insert){
                    redirect(base_url('user_payment/payment_success/'.$slug.'?txn_id='.$transactionID.'&method=stripe'));
                }

                
                $data['status'] = 1;
                $data['msg'] = 'Payment Successfull';


                $this->session->set_flashdata('payment_msg', $statusMsg);
            }else{ 
                $data['msg'] = 'Payment failed';
                $data['status'] = 0;
                redirect(base_url('user_payment/payment_cancel/'.$slug));
            } 

            } else { 
                $data['msg'] = 'Transaction has been failed!';
                $data['status'] = 0;

                redirect(base_url('user_payment/payment_cancel/'.$slug));
            }
         } else { 
                $statusMsg = "Error on form submission."; 
                redirect(base_url('user_payment/payment_cancel/'.$slug));
        }  

        

    }

    // get curl handle method
    private function get_curl_handle($data,$secret_key) {
        $url = 'https://api.stripe.com/v1/charges';
        $key_secret = $secret_key;
        //cURL Request
        $ch = curl_init();
        //set the url, number of POST vars, POST data
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_USERPWD, $key_secret);
        curl_setopt($ch, CURLOPT_TIMEOUT, 60);
        curl_setopt($ch, CURLOPT_POST, 1);
        $params = http_build_query($data);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $params);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, true);
        $output = curl_exec ($ch);
        return $output;
    }


     public function payment_cancel($slug){
        $data= [];
        $settings = settings();
        $u_info = $this->admin_m->get_restaurant_info_slug($slug); //get user info by id from paypal url
        $id = get_id_by_slug($slug);
        $data['id']=$id;
        $data['slug']=$slug;

        if(empty($id)){
            redirect(base_url('error-404'));
        }
        
        $data['id'] = $u_info['user_id'];
        $data['slug'] = $u_info['username'];
        $data['user'] = $this->admin_m->get_profile_info($id);
        $data['shop'] = $this->admin_m->get_restaurant_info($id);
        $data['shop_id'] = $data['shop']['id'];
        $data['social'] = json_decode($data['shop']['social_list'],TRUE);
        $data['status'] = 1;
        $data['msg'] = 'Payment Successfull';
        $data['main_content'] = $this->load->view('payment/payment_cancel', $data, TRUE);
        $this->load->view('payment_index',$data);

     }


    /* end stripe payment
    ================================================== */

    /*----------------------------------------------
        STRIPE FPX
    ----------------------------------------------*/

    public function stripe_fpx(){
        if(isset($_GET['slug'])){
            $slug = $_GET['slug'];
        }else{
           redirect(base_url('error-404'));
        }
       $u_info = $this->admin_m->get_restaurant_info_slug($slug); //get user info by id from paypal url
       
        $id = get_id_by_slug($slug);
        $data['id']=$id;
        if(empty($id)){
            redirect(base_url('error-404'));
        }

        $stripe_fpx = json_decode($u_info['fpx_config']);
        $stripe = $this->input->get();
        \Stripe\Stripe::setApiKey($stripe_fpx->fpx_secret_key);

            $intent = \Stripe\PaymentIntent::retrieve($stripe['payment_intent']); //PAYMENT_INTENT_ID
            $charges = $intent->charges->data;
        if($stripe['redirect_status']=="succeeded"):
            $bank_name = $charges[0]->payment_method_details->fpx->bank;
            $bank_txn = $charges[0]->payment_method_details->fpx->transaction_id;

            $payment = auth('payment');
            $total_price = $payment['total']; 
            $data_info = array(
                'user_id' => $u_info['user_id'],
                'order_id' =>$payment['uid'],
                'shop_id' =>$payment['shop_id'],
                'order_type' =>$payment['order_type'],
                'price' => $charges[0]->amount_captured/100,
                'currency_code' => $charges[0]->currency,
                'status' => $charges[0]->status,
                'txn_id' => $charges[0]->balance_transaction,
                'payment_by' => 'stripe_fpx',
                'created_at' => d_time(),
                'all_info' => json_encode(['bank_name'=>$bank_name,'bank_txn_id'=>$bank_txn]),
            );
            $insert = $this->common_m->insert($data_info,'order_payment_info');

            redirect(base_url('user_payment/payment_success/'.$slug.'?txn_id='.$charges[0]->balance_transaction.'&method=stripe_fpx'));
           
        elseif($stripe['redirect_status']=="failed"):
             redirect(base_url('user_payment/payment_cancel/'.$slug.'/stripe_fpx'));
        endif;

    }

    /*----------------------------------------------
       START  PAYTM
    ----------------------------------------------*/ 


    public function paytm_verify(){

        $slug = $_GET['slug'];
        $u_info = $this->admin_m->get_restaurant_info_slug($slug); //get user info by id from paypal url
       
        $id = get_id_by_slug($slug);
        $data['id']=$id;
        if(empty($id)){
            redirect(base_url('error-404'));
        }
        $mkey = $_GET['key'];
        require_once("vendor/paytm/paytmchecksum/PaytmChecksum.php");
        $checksum = (!empty($_POST['CHECKSUMHASH'])) ? $_POST['CHECKSUMHASH'] : '';
        unset($_POST['CHECKSUMHASH']);
        $verifySignature = PaytmChecksum::verifySignature($_POST, $mkey, $checksum);
        if($verifySignature){
            $payment = auth('payment');
            $total_price = $payment['total']; 
            $data_info = array(
                'user_id' => $u_info['user_id'],
                'order_id' =>$payment['uid'],
                'shop_id' =>$payment['shop_id'],
                'order_type' =>$payment['order_type'],
                'price' => $_POST['TXNAMOUNT'],
                'currency_code' => $_POST['CURRENCY'],
                'status' => $_POST['STATUS']=='TXN_SUCCESS'?'success':$_POST['STATUS'],
                'txn_id' => $_POST['TXNID'],
                'payment_by' => 'paytm',
                'created_at' => d_time(),
                'all_info' => json_encode(['bank_name'=>$_POST['BANKNAME'],'bank_txn_id'=>$_POST['BANKTXNID'],'gateway'=>$_POST['GATEWAYNAME'],'payment_mode'=>$_POST['PAYMENTMODE']]),
            );
            $insert = $this->common_m->insert($data_info,'order_payment_info');
            redirect(base_url('user_payment/payment_success/'.$slug.'?txn_id='.$_POST['TXNID'].'&method=paytm'));

        }else{
            redirect(base_url('user_payment/payment_cancel/'.$slug.'/paytm'));
        }
    }

    /*----------------------------------------------
        MERCADOPAGO
    ----------------------------------------------*/
    public function mercado(){
        $slug = $_GET['slug'];
        $u_info = $this->admin_m->get_restaurant_info_slug($slug); //get user info by id from paypal url
       
        $id = get_id_by_slug($slug);
        $data['id']=$id;
        if(empty($id)){
            redirect(base_url('error-404'));
        }
        $settings = settings();
        $mercado = !empty($u_info['mercado_config'])?json_decode($u_info['mercado_config']):'';

        $respuesta = array(
            'Payment' => $_GET['payment_id'],
            'Status' => $_GET['status'],
            'MerchantOrder' => $_GET['merchant_order_id']        
        ); 
        MercadoPago\SDK::setAccessToken($mercado->access_token);
        $merchant_order = $_GET['payment_id'];

        $payment = MercadoPago\Payment::find_by_id($merchant_order);

        $payments = auth('payment');
        $total_price = $payments['total']; 
        if($_GET['status']=='approved'):
            $merchant_order = MercadoPago\MerchantOrder::find_by_id($payment->order->id);
            if($payment->transaction_details->total_paid_amount >= $total_price):
                $data_info = array(
                    'user_id' => $u_info['user_id'],
                    'order_id' =>$payments['uid'],
                    'shop_id' =>$payments['shop_id'],
                    'price' => $payment->transaction_details->total_paid_amount,
                    'currency_code' => $payment->currency_id,
                    'status' => $payment->status,
                    'txn_id' => $_GET['preference_id'],
                    'payment_by' => 'paytm',
                    'created_at' => d_time(),
                    'all_info' => json_encode($merchant_order->payments),
                );
                $insert = $this->common_m->insert($data_info,'order_payment_info');
                redirect(base_url('user_payment/payment_success/'.$slug.'?txn_id='.$_GET['preference_id'].'&method=mercadopago'));
            else:
                $data_info = array(
                    'user_id' => $u_info['user_id'],
                    'order_id' =>$payments['uid'],
                    'shop_id' =>$payments['shop_id'],
                    'price' => $payment->transaction_details->total_paid_amount,
                    'currency_code' => $payment->currency_id,
                    'status' => $payment->status,
                    'txn_id' => $_GET['preference_id'],
                    'payment_by' => 'paytm',
                    'created_at' => d_time(),
                    'all_info' => json_encode($merchant_order->payments),
                );
                $insert = $this->common_m->insert($data_info,'order_payment_info');
                redirect(base_url('user_payment/payment_success/'.$slug.'?txn_id='.$_GET['preference_id'].'&method=mercadopago'));
            endif;
        else:
            redirect(base_url('user_payment/payment_cancel/'.$slug.'/mercadopago'));
            exit();
        endif;

        $paid_amount = 0;
        foreach ($merchant_order->payments as $payment) {   
            if ($payment['status'] == 'approved'){
                $paid_amount += $payment['transaction_amount'];
            }
        }
        echo "<pre>";print_r($merchant_order->payments);exit();
    // If the payment's transaction amount is equal (or bigger) than the merchant_order's amount you can release your items
        if($paid_amount >= $merchant_order->total_amount){
                if (count($merchant_order->shipments)>0) { // The merchant_order has shipments
                    if($merchant_order->shipments[0]->status == "ready_to_ship") {
                        print_r("Totally paid. Print the label and release your item.");
                    }
                } else { // The merchant_order don't has any shipments
                print_r("Totally paid. Release your item.");
            }
        } else {
            print_r("Not paid yet. Do not release your item.");
        }

        echo "<pre>";print_r($_GET);exit();


    }


    /*----------------------------------------------
FLUTTERWAVE
----------------------------------------------*/



    public function flutterwave_create_transaction()
    {
        $post = $_POST;
        $data = array(
            'amount'=>$post['amount'],
            'customer_email' => $post['customer_email'],
            'redirect_url'=>base_url("user_payment/flutterwave_payment_status/?slug={$post['slug']}"),
            'payment_plan'=>$post['payment_plan'],
            'csrf_test_name' =>$this->security->get_csrf_hash(),
            'slug' =>$post['slug'],
        );
        $this->response = $this->user_payment_m->create_flutterwave_payment($data);
     
        if(!empty($this->response) || $this->response != ''){
            $this->response = json_decode($this->response,1);
            if(isset($this->response['status']) && $this->response['status'] == 'success'){
                redirect($this->response['data']['link']);
            }else{
                $this->session->set_flashdata('message_type', 'danger');
                $this->session->set_flashdata('message', 'API returned error >> '.$this->response['message']);
                redirect(base_url('user_payment/payment_cancel/'.$_POST['slug'].'/flutterwave'));
            }
        }
    }
    public function flutterwave_payment_status()
    {
        $params = $this->input->get();

        $slug = $_GET['slug'];
        $u_info = $this->admin_m->get_restaurant_info_slug($slug); //get user info by id from paypal url
       
        $id = get_id_by_slug($slug);
        $data['id']=$id;
        if(empty($id)){
            redirect(base_url('error-404'));
        }

        $payment = auth('payment');
        $total_price = $payment['total']; 


        if(empty($params)){
            redirect(base_url('user_payment/payment_cancel/'.$slug.'/flutterwave'));
        }elseif(isset($params['txref']) && !empty($params['txref'])){
            $response = $this->user_payment_m->verify_transaction($params['txref'],$slug);
            if(!empty($response)){
                $response = json_decode($response,1);
                if($response['status'] == 'success' && isset($response['data']['chargecode']) && ( $response['data']['chargecode'] == '00' || $response['data']['chargecode'] == '0') ){
                    
                    $data['payment_plan']    = $response['data']['paymentplan'];
                    $data['customer_email']         = $response['data']['custemail'];
                    $data['txn_id']         = $response['data']['txref'];
                    $data['amount']    = $response['data']['amount'];
                    $data['currency_code']  = $response['data']['currency'];
                    $data['status']         = $response['data']['status'];
                    $data['message']        = $response['message'];
                    $data['full_data']      = $response;

                    $data_info = array(
                        'user_id' => $u_info['user_id'],
                        'order_id' =>$payment['uid'],
                        'shop_id' =>$payment['shop_id'],
                        'order_type' =>$payment['order_type'],
                        'price' => $response['data']['amount'],
                        'currency_code' => $response['data']['currency'],
                        'status' => $response['data']['status'],
                        'txn_id' => $response['data']['txref'],
                        'payment_by' => 'flutterwave',
                        'created_at' => d_time(),
                        'all_info' => json_encode(['customer_email'=>$response['data']['custemail'],'narration'=>$response['data']['narration'],'ip'=>$response['data']['custemail'],'txid'=>$response['data']['custemail']]),
                    );
                    $insert = $this->common_m->insert($data_info,'order_payment_info');

                    redirect(base_url('user_payment/payment_success/'.$slug.'?txn_id='.$response['data']['txref'].'&method=flutterwave'));

                }elseif( (isset($params['cancelled']) && $params['cancelled'] == true)){
                    redirect(base_url('user_payment/payment_cancel/'.$slug.'/flutterwave'));

                }elseif( $response['status'] == 'error'){
                    redirect(base_url('user_payment/payment_cancel/'.$slug.'/flutterwave'));
                }
            }else{
                
                redirect(base_url('user_payment/payment_cancel/'.$slug.'/flutterwave'));
            }
        }
    }

    public function verify_payment($ref) {
        

        $result = array();
        $slug = isset($_GET['user'])?$_GET['user']:'';
        $u_info = $this->admin_m->get_restaurant_info_slug($slug); //get user info by id from paypal url
       
        $id = get_id_by_slug($slug);
        $data['id']=$id;
        if(empty($id)){
            redirect(base_url('error-404'));
        }

        $payment = auth('payment');
        $total_price = $payment['total']; 


        $paystack = !empty($u_info['paystack_config'])?json_decode($u_info['paystack_config']):'';
        $paystack_secret_key = !empty($paystack->paystack_secret_key)?$paystack->paystack_secret_key:'';

        $url = 'https://api.paystack.co/transaction/verify/'.$ref;
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        //
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
        curl_setopt(
            $ch, CURLOPT_HTTPHEADER, [
                'Authorization: Bearer '.$paystack_secret_key]
            );
        $request = curl_exec($ch);

        curl_close($ch);
        //
        if ($request) {
            $result = json_decode($request, true);
            // print_r($result);
            if($result){
                if($result['data']){
                    //something came in
                    if($result['data']['status'] == 'success'){

                        //echo "Transaction was successful";
                        $this->paystack_success($ref,$slug,$paystack_secret_key,'success');

                    }else{
                        // the transaction was not successful, do not deliver value'
                        // print_r($result);  //uncomment this line to inspect the result, to check why it failed.
                        $this->paystack_success($ref,$slug,$account_slug,'fail');

                    }
                }
                else{

                    //echo $result['message'];
                    $this->paystack_success($ref,$slug,$account_slug,'fail');
                }

            }else{
                //print_r($result);
                //die("Something went wrong while trying to convert the request variable to json. Uncomment the print_r command to see what is in the result variable.");
                $this->paystack_success($ref,$slug,$account_slug,'fail');
            }
        }else{
            //var_dump($request);
            //die("Something went wrong while executing curl. Uncomment the var_dump line above this line to see what the issue is. Please check your CURL command to make sure everything is ok");
            $this->paystack_success($ref,$slug,$account_slug,'fail');
        }

    }

    public function paystack_success($ref,$slug,$secret_key,$type) {
        $data = array();
        if($type=="success"):
            $info = $this->getPaymentInfo($ref,$secret_key);
            $u_info = $this->admin_m->get_restaurant_info_slug($slug);
            $payment = auth('payment');
            $total_price = $payment['total']; 
            $data_info = array(
                'user_id' => $u_info['user_id'],
                'order_id' =>$payment['uid'],
                'shop_id' =>$payment['shop_id'],
                'order_type' =>$payment['order_type'],
                'price' => $info['amount']/100,
                'currency_code' => $info['currency'],
                'status' => $info['status'],
                'txn_id' => $info['reference'],
                'payment_by' => 'paystack',
                'created_at' => d_time(),
                'all_info' => json_encode(['customer_email'=>$info['customer']['email'],'ip'=>$info['ip_address'],'customer_code'=>$info['customer']['customer_code']]),
            );
            $insert = $this->common_m->insert($data_info,'order_payment_info');

            redirect(base_url('user_payment/payment_success/'.$slug.'?txn_id='.$info['reference'].'&method=paystack'));
        else:
            $data = [
                'amount' => $info['amount']/100,
                'currency' => $info['currency'],
                'status' => 'Failed',
                'txn_id' => '1254879287',
                'payment_type' => 'paystack',
                'all_info' => '',
            ];

            $this->send_failed($slug,$account_slug,$data);
        endif;

    }

    private function getPaymentInfo($ref,$secret_key) {
       
        $result = array();
        $url = 'https://api.paystack.co/transaction/verify/'.$ref;
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        //
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
        curl_setopt(
            $ch, CURLOPT_HTTPHEADER, [
                'Authorization: Bearer '.$secret_key]
            );
        $request = curl_exec($ch);
        curl_close($ch);
        $result = json_decode($request, true);
        return $result['data'];

    }



}