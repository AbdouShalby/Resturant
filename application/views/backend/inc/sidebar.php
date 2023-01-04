  <?php $my_info = get_user_info(); ?>
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="<?= base_url(!empty(html_escape($my_info['thumb']))?html_escape($my_info['thumb']):'assets/frontend/images/avatar.png')?>" class="img-circle uploaded_img" alt="User Image">
        </div>
        <div class="pull-left info">
          <p><?= !empty(html_escape($my_info['name']))?html_escape($my_info['name']):$my_info['username'] ; ?></p>
          <span id="time"></span>
        </div>
      </div>
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu" data-widget="tree">


        <li class="nav-drawer-header"><?= lang('general'); ?></li>
        <!-- <li class="header">MAIN NAVIGATION</li> -->
        <li class="<?= isset($page_title) && $page_title =="Dashboard"?"active":""; ?>">
          <a href="<?= base_url('admin/dashboard') ?>">
            <i class="icofont-dashboard fz-20"></i> <span><?= !empty(lang('dashboard'))?lang('dashboard'):"Dashboard";?></span>
          </a>
        </li>



        <?php if($this->settings['is_update']==0): ?>
          <?php if(isset($this->auth['user_role']) && $this->auth['user_role']==1): ?>
              <?php if($this->is_redirect==0){ ?>
                      
                <?php include 'admin_sidebar.php'; ?> 

              <?php };?> <!-- is redirect -->
           <?php endif;?> <!-- end user role 1 -->
        <?php endif; ?><!-- is_update -->

        <!-- User section -->
        <?php if(isset($this->auth['user_role']) && $this->auth['user_role']==0): ?>
          <?php if($this->auth['is_verify']==1): ?>
            <?php if($this->my_info['is_deactived']==0): ?>
                <?php include 'user_sidebar.php'; ?>
              <?php endif; ?><!--user_role==0  -->
          <?php endif; ?><!-- is_verify==1 -->


          <?php if(!auth('is_staff')): ?>
            <?php if($this->my_info['is_deactived']==0): ?>
              <li class="<?= $page_title =="Deactive"?"active":"";?> deactivation_btn">
                <a href="<?= base_url('admin/auth/deactive_account/1/'.html_escape($this->my_info['username'])); ?>" class="action_btn" data-msg="<?= lang('want_to_deactive_account'); ?>">
                  <i class="fa fa-ban"></i> <span><?= !empty(lang('deactive_account'))?lang('deactive_account'):"Deactive Account";?></span>
                </a>
              </li>
              <?php else: ?> <!-- is_deactive -->
              <li class="<?= $page_title =="Deactive"?"active":"";?> activation_btn">
                <a href="<?= base_url('admin/auth/deactive_account/0/'.html_escape($my_info['username'])); ?>" data-msg="<?= lang('want_to_active_account'); ?>" class="action_btn">
                  <i class="fa fa-check"></i> <span><?= !empty(lang('active_account'))?lang('active_account'):"Active Account";?></span>
                </a>
              </li>
              <?php endif;?> <!-- deactive -->
            <?php endif;?>


            
        <?php endif; ?><!-- user role==0 -->
        <!-- User section -->





      </ul>

    </section>
    <!-- /.sidebar -->
</aside>


<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <!-- Main content -->
    <section class="content">
    <?php include 'waiter_notification.php'; ?>

     