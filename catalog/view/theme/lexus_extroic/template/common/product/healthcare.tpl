<?php $objlang = $this->registry->get('language');  $ourl = $this->registry->get('url');   ?>
 <div class="product-block item-healthcare" itemtype="http://schema.org/Product" itemscope>
    
    <div class="block-img">
        <?php if ($product['thumb']) {    ?>
            <?php if( $product['special'] ) {   ?>
            <span class="product-label exist">
                <span class="product-label-special"><?php echo $objlang->get( 'text_sale' ); ?></span>
            </span>
        <?php } ?>

            <div class="image">
                <a class="img" itemprop="url" title="<?php echo $product['name']; ?>" href="<?php echo $product['href']; ?>">
                    <img class="img-responsive" itemprop="image" src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" />
                </a>
            </div>

            <div class="cart-inner">
                <?php if ($product['price']) { ?>
                <div class="price">
                    <?php if (!$product['special']) {  ?>
                        <span class="special-price"><?php echo $product['price']; ?></span>
                        <?php if( preg_match( '#(\d+).?(\d+)#',  $product['price'], $p ) ) { ?>
                        <?php } ?>
                    <?php } else { ?>
                        <span class="price-old"><?php echo $product['price']; ?></span>
                        <span class="price-new"><?php echo $product['special']; ?></span>

                        <?php if( preg_match( '#(\d+).?(\d+)#',  $product['special'], $p ) ) { ?>
                        
                        <?php } ?>

                    <?php } ?>
                </div>
                <?php } ?>

                <?php if( !isset($listingConfig['catalog_mode']) || !$listingConfig['catalog_mode'] ) { ?>
                 <div class="cart">
                    <button data-loading-text="Loading..." class="btn btn-default" type="button" onclick="cart.addcart('<?php echo $product['product_id']; ?>');">
        <!--             <i class="fa fa-shopping-cart"></i> --> 
                    <?php echo $button_cart; ?>
                </button>
                 </div>
                <?php } ?>
                </div>
        <?php } ?>


        <!-- button active -->
         <div class="action">
             <div class="quick-view">
                <a class="btn btn-success iframe-link" data-toggle="tooltip" href="<?php echo $ourl->link('themecontrol/product','product_id='.$product['product_id']);?>"  title="<?php echo $objlang->get('quick_view'); ?>" ><i class="fa fa-eye"></i></a>
             </div>
             <div class="wishlist">
               <button class="btn btn-success" type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.addwishlist('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>  
            </div>

            <div class="compare">
                <button class="btn btn-success" type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.addcompare('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button> 
            </div>
        </div>
    </div>

    <div class="product-meta">

        <div class="meta">
            <h3 class="name" itemprop="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h3>
            
            <?php if ($product['price']) { ?>
                <div class="price price_sidebar">
                    <?php if (!$product['special']) {  ?>
                        <span class="special-price"><?php echo $product['price']; ?></span>
                        <?php if( preg_match( '#(\d+).?(\d+)#',  $product['price'], $p ) ) { ?>
                        <?php } ?>
                    <?php } else { ?>
                        <span class="price-old"><?php echo $product['price']; ?></span>
                        <span class="price-new"><?php echo $product['special']; ?></span>

                        <?php if( preg_match( '#(\d+).?(\d+)#',  $product['special'], $p ) ) { ?>
                        
                        <?php } ?>

                    <?php } ?>
                </div>
            <?php } ?>

            <?php if ( isset($product['rating']) ) { ?>
              <div class="rating">
                <?php for ($is = 1; $is <= 5; $is++) { ?>
                <?php if ($product['rating'] < $is) { ?>
                <span class="fa fa-stack"><i class="fa fa-star-o"></i></span>
                <?php } else { ?>
                <span class="fa fa-stack"><i class="fa fa-star"></i>
                </span>
                <?php } ?>
                <?php } ?>
              </div>
          <?php } ?>

            <?php if( isset($product['description']) ){ ?>
                <p class="description" itemprop="description"><?php echo utf8_substr( strip_tags($product['description']),0,220);?>...</p>
            <?php } ?>
        </div>
    </div>

</div>