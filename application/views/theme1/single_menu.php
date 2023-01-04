<section class="sectionDefault">
	<?php include "include/banner.php"; ?>
	<div class="section_items">
  
  <?php include APPPATH.'views/common_layouts/coupon_list.php'; ?>


    <div class="defaultHeading text-center">
      <h1 class="mb-6"><?= get_title($id,'menu',1) ;?></h1>
      <?php if(!empty(get_title($id,'menu',2))): ?>
        <p><?= get_title($id,'menu',2) ;?></p>
      <?php endif;?>
    </div>
  <div class="restaurant-container style_2 theme_1">
    <div class="row">
      <div class="col-md-12">
        <div class="gallery_area">
          <div class="gallery_top_menu">
            <ul class="gallery_sort category_shot">
              <li><button  id='0' class="active default-button"><?= lang('all'); ?></button></li>
              <?php foreach ($all_items as $key => $type): ?>
                  <?php if(count($type['items'])>0): ?>
                    <li><button  id="<?= $type['id'] ;?>"><?= html_escape($type['name']);?></button></li>
                  <?php endif;?>
              <?php endforeach ?>
            </ul>
          </div>
          <div class="all_categories" >
              <?php $guestLang = $GLOBALS['LANG']->is_loaded['content_lang.php'] ?>
            <?php $ids = []; ?>
           <?php foreach ($all_items as $key => $type): ?>
            <?php $ids[] = $type['id'] ?>
            <?php if(count($type['items'])>0): ?>
              <div class="homeView category_<?= $type['id'] ;?>" id="category_<?= $type['id'] ;?>">
                <div class="row">
                  <div class="col-md-12">
                    <div class="singleCategoryHeader">
                      <h4>
                          <?php if ($_SESSION['site_lang'] === 'english' || $guestLang === 'english') {
                            echo html_escape($type['name_en']);
                          } elseif ($_SESSION['site_lang'] === 'arabics' || $guestLang === 'arabics') {
                              if (!empty($type['name_ar'])) {
                                  echo html_escape($type['name_ar']);
                              } else {
                                  echo html_escape($type['name_en']);
                              }
                          } elseif ($_SESSION['site_lang'] === 'uzbek' || $guestLang === 'uzbek') {
                              if (!empty($type['name_uz'])) {
                                  echo html_escape($type['name_uz']);
                              } else {
                                  echo html_escape($type['name_en']);
                              }
                          } elseif ($_SESSION['site_lang'] === 'russian' || $guestLang === 'russian') {
                              if (!empty($type['name_ru'])) {
                                  echo html_escape($type['name_ru']);
                              } else {
                                  echo html_escape($type['name_en']);
                              }
                          } elseif ($_SESSION['site_lang'] === 'chinese' || $guestLang === 'chinese') {
                              if (!empty($type['name_ch'])) {
                                  echo html_escape($type['name_ch']);
                              } else {
                                  echo html_escape($type['name_en']);
                              }
                          } elseif ($_SESSION['site_lang'] === 'french' || $guestLang === 'french') {
                              if (!empty($type['name_fr'])) {
                                  echo html_escape($type['name_fr']);
                              } else {
                                  echo html_escape($type['name_en']);
                              }
                          } elseif ($_SESSION['site_lang'] === 'portuguese' || $guestLang === 'portuguese') {
                              if (!empty($type['name_po'])) {
                                  echo html_escape($type['name_po']);
                              } else {
                                  echo html_escape($type['name_en']);
                              }
                          } elseif ($_SESSION['site_lang'] === 'hindi' || $guestLang === 'hindi') {
                              if (!empty($type['name_hi'])) {
                                  echo html_escape($type['name_hi']);
                              } else {
                                  echo html_escape($type['name_en']);
                              }
                          } else {
                              echo html_escape($type['name_en']);
                          } ?>
                      </h4>
                      <?php if(count($type['items'])>= 4): ?>
                        <a href="<?= base_url('item-types/'.$slug.'/'.md5($type['id'])) ;?>" class="seeMore_link"><?= lang('see_more'); ?> &nbsp;<i class="icofont-thin-double-right fw_bold"></i></a>
                      <?php endif; ?>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <?php foreach ($type['items'] as $key => $row): ?>
                    <div class="col-xl-3 col-lg-6 col-md-4 col-sm-4 col-6 q-sm ">
                     <?php include 'include/item_thumbs.php'; ?>
                   </div>
                 <?php endforeach ?>
               </div> 
             </div>
           <?php endif;?>
         <?php endforeach; ?> 
          </div>
        </div><!-- gallery_area -->
      </div>
    </div>
  </div>
</div>
</section>
<script>
  var categories = <?= json_encode($ids) ;?>;
</script>