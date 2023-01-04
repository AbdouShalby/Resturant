	<div class="homeSingle_item">
		<div class="item_images quick_view" data-id="<?=  html_escape($row['item_id']);?>">
			<div class="homeSingleImg menu-img img bg_loader" data-src="<?= get_img($row['thumb'],$row['img_url'],$row['img_type']) ;?>" style="background: url(<?= img_loader();?>);"></div>
		</div>
        <?php $guestLang = $GLOBALS['LANG']->is_loaded['content_lang.php'] ?>
		<div class="homeItemDetails list_view">
			<div class="homeItem_left">
				<div class="topTitle">
					<div class="top___title">
						<h4>
                            <?php if ($_SESSION['site_lang'] === 'english' || $guestLang === 'english') {
                                echo html_escape($row['title']);
                            } elseif ($_SESSION['site_lang'] === 'arabics' || $guestLang === 'arabics') {
                                if (!empty($row['title_ar'])) {
                                    echo html_escape($row['title_ar']);
                                } else {
                                    echo html_escape($row['title']);
                                }
                            } elseif ($_SESSION['site_lang'] === 'uzbek' || $guestLang === 'uzbek') {
                                if (!empty($row['title_uz'])) {
                                    echo html_escape($row['title_uz']);
                                } else {
                                    echo html_escape($row['title']);
                                }
                            } elseif ($_SESSION['site_lang'] === 'russian' || $guestLang === 'russian') {
                                if (!empty($row['title_ru'])) {
                                    echo html_escape($row['title_ru']);
                                } else {
                                    echo html_escape($row['title']);
                                }
                            } elseif ($_SESSION['site_lang'] === 'chinese' || $guestLang === 'chinese') {
                                if (!empty($row['title_ch'])) {
                                    echo html_escape($row['title_ch']);
                                } else {
                                    echo html_escape($row['title']);
                                }
                            } elseif ($_SESSION['site_lang'] === 'french' || $guestLang === 'french') {
                                if (!empty($row['title_fr'])) {
                                    echo html_escape($row['title_fr']);
                                } else {
                                    echo html_escape($row['title']);
                                }
                            } elseif ($_SESSION['site_lang'] === 'portuguese' || $guestLang === 'portuguese') {
                                if (!empty($row['title_po'])) {
                                    echo html_escape($row['title_po']);
                                } else {
                                    echo html_escape($row['title']);
                                }
                            } elseif ($_SESSION['site_lang'] === 'hindi' || $guestLang === 'hindi') {
                                if (!empty($row['title_hi'])) {
                                    echo html_escape($row['title_hi']);
                                } else {
                                    echo html_escape($row['title']);
                                }
                            } else {
                                echo html_escape($row['title']);
                            } ?>
                        </h4>
						<?php if(isset($row['veg_type']) && $row['veg_type'] !=0): ?> <i class="fa fa-circle veg_type <?= $row['veg_type']==1?'c_green':'c_red';?>" data-placement="top" data-toggle="tooltip" title="<?= veg_type($row['veg_type']);?>"></i><?php endif;?>
					</div>
					<?php if($row['is_size']==0): ?>
						<div class="homeItem_right">
							<p><?= currency_position($row['price'],$row['shop_id']); ?> </p>
						</div>
					<?php endif;?>
				</div>
				<div class="price_section">
					<p>
						<?php if(!empty($row['allergen_id']) || !empty($row['allergen'])): ?>
							<span class="capital fz-13"><?= !empty(lang('allergens'))?lang('allergens'):'allregens' ;?>: <?= is_array(json_decode($row['allergen_id']))?allergens(json_decode($row['allergen_id'])):$row['allergen'];?></span>
						<?php endif;?>
					</p>
						<p class="details <?= $row['is_size']==0?"not_is_size":"is_size" ;?>">
                            <?php if ($_SESSION['site_lang'] === 'english' || $guestLang === 'english') {
                                echo character_limiter(html_escape($row['overview']),120);
                            } elseif ($_SESSION['site_lang'] === 'arabics' || $guestLang === 'arabics') {
                                if (!empty($row['overview_ar'])) {
                                    echo character_limiter(html_escape($row['overview_ar']),120);
                                } else {
                                    echo character_limiter(html_escape($row['overview']),120);
                                }
                            } elseif ($_SESSION['site_lang'] === 'uzbek' || $guestLang === 'uzbek') {
                                if (!empty($row['overview_uz'])) {
                                    echo character_limiter(html_escape($row['overview_uz']),120);
                                } else {
                                    echo character_limiter(html_escape($row['overview']),120);
                                }
                            } elseif ($_SESSION['site_lang'] === 'russian' || $guestLang === 'russian') {
                                if (!empty($row['overview_ru'])) {
                                    echo character_limiter(html_escape($row['overview_ru']),120);
                                } else {
                                    echo character_limiter(html_escape($row['overview']),120);
                                }
                            } elseif ($_SESSION['site_lang'] === 'chinese' || $guestLang === 'chinese') {
                                if (!empty($row['overview_ch'])) {
                                    echo character_limiter(html_escape($row['overview_ch']),120);
                                } else {
                                    echo character_limiter(html_escape($row['overview']),120);
                                }
                            } elseif ($_SESSION['site_lang'] === 'french' || $guestLang === 'french') {
                                if (!empty($row['overview_fr'])) {
                                    echo character_limiter(html_escape($row['overview_fr']),120);
                                } else {
                                    echo character_limiter(html_escape($row['overview']),120);
                                }
                            } elseif ($_SESSION['site_lang'] === 'portuguese' || $guestLang === 'portuguese') {
                                if (!empty($row['overview_po'])) {
                                    echo character_limiter(html_escape($row['overview_po']),120);
                                } else {
                                    echo character_limiter(html_escape($row['overview']),120);
                                }
                            } elseif ($_SESSION['site_lang'] === 'hindi' || $guestLang === 'hindi') {
                                if (!empty($row['overview_hi'])) {
                                    echo character_limiter(html_escape($row['overview_hi']),120);
                                } else {
                                    echo character_limiter(html_escape($row['overview']),120);
                                }
                            } else {
                                echo character_limiter(html_escape($row['overview']),120);
                            } ?>
						</p>
					<?php if($row['is_size']==1): ?>
						<div class="itemPrice_area i_small ">
							<?php $price = json_decode($row['price'],TRUE); ?>
							<?php foreach ($price as $key => $value):
								if(!empty($value)):
									?>
									<div class="itemPrice i_small ">
										<p class="smallItem_size"><?= $this->admin_m->get_size_by_slug($key,$row['user_id']);?> : <?= currency_position($value,$row['shop_id']); ?></p>
									</div>
									<?php
								endif; 
							endforeach; 
							?>
						</div>
					<?php endif;?>
				</div>
				<div class="port_d_flex home_view">
					<a href="javascript:;" class="quick_view" data-id="<?=  html_escape($row['item_id']);?>" data-placement="top" data-toggle=""  title="Quick View"><i class="icofont-eye-open"></i> <span><?= lang('details'); ?></span></a>

					<?php if($row['is_size']==1): ?>
						<a href="javascript:;" class="quick_view" data-id="<?=  html_escape($row['item_id']);?>" data-placement="top" data-toggle=""  title="Quick View"><i class="icofont-ui-cart"></i> <span><?= lang('order_now'); ?></span></a>

					<?php else: ?>


						<?php if(shop($row['shop_id'])->stock_status == 1): ?>

							<?php if($row['in_stock'] > $row['remaining']): ?>
								<a href="javascript:;" class="add_to_cart" data-id="<?=  html_escape($row['item_id']);?>" data-type="item" data-placement="top" data-toggle="" title="Add to Cart"><i class="icofont-ui-cart"></i> <span><?= lang('order_now'); ?></span></a>
							<?php endif;?>

						<?php else: ?>
							<a href="javascript:;" class="add_to_cart" data-id="<?=  html_escape($row['item_id']);?>" data-type="item" data-placement="top" data-toggle="" title="Add to Cart"><i class="icofont-ui-cart"></i> <span><?= lang('order_now'); ?></span></a>

						<?php endif;?>


					<?php endif;?>
				</div>
			</div>
		</div>


	</div>
	