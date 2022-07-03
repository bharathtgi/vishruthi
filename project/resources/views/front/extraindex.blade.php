    <!--product section area start-->
    <section class="product_section womens_product">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-6 col-md-12">
                    <div class="banner_area">
                        <div class="banner_thumb">
                            <a href="{{ $ps->best_seller_banner_link }}"><img src="{{asset('assets/images/'.$ps->best_seller_banner)}}" alt="#"></a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-12">
                    <div class="section_title">
                        <h2>Vishruthi Collection</h2>
                        <p>The Joy Of Wearing The Best</p>
                    </div>
                    <div class="product_area">
                        <div class="product_tab_button">
                            <ul class="nav" role="tablist">
                                @if($ps->featured == 1)
								<li>
                                    <a class="active" data-toggle="tab" href="#Harams" role="tab" aria-controls="Harams" aria-selected="true">Harams</a>
                                </li>
								@endif
								@if($ps->best == 1)
                                <li>
                                    <a data-toggle="tab" href="#Necklace" role="tab" aria-controls="Necklace" aria-selected="false">Necklace</a>
                                </li>
								@endif
								@if($ps->top_rated == 1)
                                <li>
                                    <a data-toggle="tab" href="#Bangles" role="tab" aria-controls="Bangles" aria-selected="false">Bangles</a>
                                </li>
								@endif
								@if($ps->big == 1)
                                <li>
                                    <a data-toggle="tab" href="#Earrings" role="tab" aria-controls="Earrings" aria-selected="false">Earrings</a>
                                </li>
								@endif
                            </ul>
                        </div>
                        <div class="tab-content">
                            <div class="tab-pane fade show active" id="Harams" role="tabpanel">
                                <div class="product_container">
                                    <div class="container">
                                        <div class="row">
											@foreach($feature_products as $prod)
                                            <div class="col-md-4">
                                                <div class="single_product">
                                                    <div class="product_thumb">
                                                        <a class="primary_img" href="{{ route('front.product', $prod->slug) }}"><img src="{{ $prod->thumbnail ? asset('assets/images/thumbnails/'.$prod->thumbnail):asset('assets/images/noimage.png') }}" alt=""></a>
                                                        <div class="product_action">
                                                            <div class="hover_action">
                                                                <a href="#"><i class="fa fa-plus"></i></a>
                                                                <div class="action_button">
                                                                    <ul>
                                                                        <li style="display:none;"><a title="add to cart" href="javascript:;" class="add-to-cart" data-href="{{ route('product.cart.add',$prod->id) }}"><i class="fa fa-shopping-basket" aria-hidden="true"></i></a></li>
                                                                        @if (Auth::guard('web')->check())																		<li>																			<a href="javascript:;" title="Add to Wishlist" class="add-to-wish" data-href="{{ route('user-wishlist-add',$prod->id) }}"><i class="fa fa-heart-o" aria-hidden="true"></i></a>																		</li>																		@else																		<li>																			<a href="{{route('user.login')}}" title="Add to Wishlist" class="add-to-wis" ><i class="fa fa-heart-o" aria-hidden="true"></i></a>																		</li>																		
																		@endif
																	</ul>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="quick_button">
                                                            <a href="javascript:;" data-toggle="modal" data-target="#quickview" data-href="{{ route('product.quick',$prod->id) }}" title="quick_view" class="quick-view">+ quick view</a>
                                                        </div>
                                                    </div>
                                                    <div class="product_content">
                                                        <h3><a href="{{ route('front.product', $prod->slug) }}">{{ $prod->showName() }}</a></h3>
                                                        <span class="current_price">{{ $prod->showPrice() }}</span>
                                                    </div>
                                                </div>
                                            </div>
											@endforeach
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="Necklace" role="tabpanel">
                                <div class="product_container">
                                    <div class="container">
                                        <div class="row">
                                            @foreach($best_products as $prod)
											<div class="col-md-4">
                                                <div class="single_product">
                                                    <div class="product_thumb">
                                                        <a class="primary_img" href="{{ route('front.product', $prod->slug) }}"><img src="{{ $prod->thumbnail ? asset('assets/images/thumbnails/'.$prod->thumbnail):asset('assets/images/noimage.png') }}" alt=""></a>
                                                        <div class="product_action">
                                                            <div class="hover_action">
                                                                <a href="#"><i class="fa fa-plus"></i></a>
                                                                <div class="action_button">
                                                                    <ul>
                                                                        <li style="display:none;"><a title="add to cart" href="#"><i class="fa fa-shopping-basket" aria-hidden="true"></i></a></li>
                                                                        @if (Auth::guard('web')->check())																		<li>																			<a href="javascript:;" title="Add to Wishlist" class="add-to-wish" data-href="{{ route('user-wishlist-add',$prod->id) }}"><i class="fa fa-heart-o" aria-hidden="true"></i></a>																		</li>																		@else																		<li>																			<a href="{{route('user.login')}}" title="Add to Wishlist" class="add-to-wis" ><i class="fa fa-heart-o" aria-hidden="true"></i></a>																		</li>																																				@endif
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="quick_button">
                                                            <a href="javascript:;" data-toggle="modal" data-target="#quickview" data-href="{{ route('product.quick',$prod->id) }}" title="quick_view" class="quick-view">+ quick view</a>
                                                        </div>
                                                    </div>
                                                    <div class="product_content">
                                                        <h3><a href="{{ route('front.product', $prod->slug) }}">{{ $prod->showName() }}</a></h3>
                                                        <span class="current_price">{{ $prod->showPrice() }}</span>
                                                    </div>
                                                </div>
                                            </div>
											@endforeach
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="Bangles" role="tabpanel">
                                <div class="product_container">
                                    <div class="container">
                                        <div class="row">
                                            @foreach($top_products as $prod)
											<div class="col-md-4">
                                                <div class="single_product">
                                                    <div class="product_thumb">
                                                        <a class="primary_img" href="{{ route('front.product', $prod->slug) }}"><img src="{{ $prod->thumbnail ? asset('assets/images/thumbnails/'.$prod->thumbnail):asset('assets/images/noimage.png') }}" alt=""></a>
                                                        <div class="product_action">
                                                            <div class="hover_action">
                                                                <a href="#"><i class="fa fa-plus"></i></a>
                                                                <div class="action_button">
                                                                    <ul>
                                                                        <li style="diplay:none;"><a title="add to cart" href="#"><i class="fa fa-shopping-basket" aria-hidden="true"></i></a></li>
                                                                        @if (Auth::guard('web')->check())																		<li>																			<a href="javascript:;" title="Add to Wishlist" class="add-to-wish" data-href="{{ route('user-wishlist-add',$prod->id) }}"><i class="fa fa-heart-o" aria-hidden="true"></i></a>																		</li>																		@else																		<li>																			<a href="{{route('user.login')}}" title="Add to Wishlist" class="add-to-wis" ><i class="fa fa-heart-o" aria-hidden="true"></i></a>																		</li>																																				@endif
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="quick_button">
                                                            <a href="javascript:;" data-toggle="modal" data-target="#quickview" data-href="{{ route('product.quick',$prod->id) }}" title="quick_view" class="quick-view">+ quick view</a>
                                                        </div>
                                                    </div>
                                                    <div class="product_content">
                                                        <h3><a href="{{ route('front.product', $prod->slug) }}">{{ $prod->showName() }}</a></h3>
                                                        <span class="current_price">{{ $prod->showPrice() }}</span>
                                                    </div>
                                                </div>
                                            </div>
											@endforeach
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="Earrings" role="tabpanel">
                                <div class="product_container">
                                    <div class="container">
                                        <div class="row">
                                            @foreach($big_products as $prod)
											<div class="col-md-4">
                                                <div class="single_product">
                                                    <div class="product_thumb">
                                                        <a class="primary_img" href="{{ route('front.product', $prod->slug) }}"><img src="{{ $prod->thumbnail ? asset('assets/images/thumbnails/'.$prod->thumbnail):asset('assets/images/noimage.png') }}" alt=""></a>
                                                        <div class="product_action">
                                                            <div class="hover_action">
                                                                <a href="#"><i class="fa fa-plus"></i></a>
                                                                <div class="action_button">
                                                                    <ul>
                                                                        <li style="display:none;"><a title="add to cart" href="#"><i class="fa fa-shopping-basket" aria-hidden="true"></i></a></li>
                                                                        @if (Auth::guard('web')->check())																		<li>																			<a href="javascript:;" title="Add to Wishlist" class="add-to-wish" data-href="{{ route('user-wishlist-add',$prod->id) }}"><i class="fa fa-heart-o" aria-hidden="true"></i></a>																		</li>																		@else																		<li>																			<a href="{{route('user.login')}}" title="Add to Wishlist" class="add-to-wis" ><i class="fa fa-heart-o" aria-hidden="true"></i></a>																		</li>																																				@endif
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="quick_button">
                                                            <a href="javascript:;" data-toggle="modal" data-target="#quickview" data-href="{{ route('product.quick',$prod->id) }}" title="quick_view" class="quick-view">+ quick view</a>
                                                        </div>
                                                    </div>
                                                    <div class="product_content">
                                                        <h3><a href="{{ route('front.product', $prod->slug) }}">{{ $prod->showName() }}</a></h3>
                                                        <span class="current_price">{{ $prod->showPrice() }}</span>
                                                    </div>
                                                </div>
                                            </div>
											@endforeach
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </section>
    <!--product section area end-->

    <!--banner area start-->
    <section class="banner_section">
        <div class="container-fluid">
            <div class="row ">
                <div class="col-12">
                    @foreach($large_banners->chunk(1) as $chunk)
					@foreach($chunk as $img)
						<div class="banner_conteiner" style="background-image: url({{asset('assets/images/banners/'.$img->photo)}});">
							<div class="banner_text">
								<h1>Each Jewellery<br>has a story</h1>
								<a href="{{ $img->link }}">Discover Now</a>
							</div>
						</div>					
					@endforeach
					@endforeach

                </div>
            </div>
        </div>
    </section>
    <!--banner area end-->

    <!--product section area start-->
    <section class="product_section mens_product">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-6 col-md-12">
                    <div class="section_title">
                        <h2>Exclusive Collection</h2>
                        <p>Desire Meets a New Style</p>
                    </div>
                    <div class="product_area">
                        <div class="product_tab_button">
                            <ul class="nav" role="tablist">
                                @if($ps->hot_sale == 1)
								<li>
                                    <a class="active" data-toggle="tab" href="#hipbelt" role="tab" aria-controls="hipbelt" aria-selected="true">Hip Belts & Armlets </a>
                                </li>
								<li>
                                    <a data-toggle="tab" href="#Hair" role="tab" aria-controls="Hair" aria-selected="false">Hair Ornaments</a>
                                </li>
                                <li>
                                    <a data-toggle="tab" href="#Anklet" role="tab" aria-controls="Anklet" aria-selected="false">Anklet & Toe RIng</a>
                                </li>
                                <li>
                                    <a data-toggle="tab" href="#Pendants" role="tab" aria-controls="Pendants" aria-selected="false">Pendants</a>
                                </li>
								@endif
                            </ul>
                        </div>
                        <div class="tab-content">
                            <div class="tab-pane fade show active" id="hipbelt" role="tabpanel">
                                <div class="product_container">
                                    <div class="container">
                                        <div class="row">
                                            @foreach($hot_products as $prod)
											<div class="col-md-4">
                                                <div class="single_product">
                                                    <div class="product_thumb">
                                                        <a class="primary_img" href="{{ route('front.product', $prod->slug) }}"><img src="{{ $prod->thumbnail ? asset('assets/images/thumbnails/'.$prod->thumbnail):asset('assets/images/noimage.png') }}" alt=""></a>
                                                        <div class="product_action">
                                                            <div class="hover_action">
                                                                <a href="#"><i class="fa fa-plus"></i></a>
                                                                <div class="action_button">
                                                                    <ul>
                                                                        <li style="display:none;"><a title="add to cart" href="#"><i class="fa fa-shopping-basket" aria-hidden="true"></i></a></li>
                                                                        @if (Auth::guard('web')->check())																		<li>																			<a href="javascript:;" title="Add to Wishlist" class="add-to-wish" data-href="{{ route('user-wishlist-add',$prod->id) }}"><i class="fa fa-heart-o" aria-hidden="true"></i></a>																		</li>																		@else																		<li>																			<a href="{{route('user.login')}}" title="Add to Wishlist" class="add-to-wis" ><i class="fa fa-heart-o" aria-hidden="true"></i></a>																		</li>																																				@endif
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="quick_button">
                                                            <a href="javascript:;" data-toggle="modal" data-target="#quickview" data-href="{{ route('product.quick',$prod->id) }}" title="quick_view" class="quick-view">+ quick view</a>
                                                        </div>
                                                    </div>
                                                    <div class="product_content">
                                                        <h3><a href="{{ route('front.product', $prod->slug) }}">{{ $prod->showName() }}</a></h3>
                                                        <span class="current_price">{{ $prod->showPrice() }}</span>
                                                    </div>
                                                </div>
                                            </div>
											@endforeach                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="Hair" role="tabpanel">
                                <div class="product_container">
                                    <div class="container">
                                        <div class="row">
                                            @foreach($latest_products as $prod)
											<div class="col-md-4">
                                                <div class="single_product">
                                                    <div class="product_thumb">
                                                        <a class="primary_img" href="{{ route('front.product', $prod->slug) }}"><img src="{{ $prod->thumbnail ? asset('assets/images/thumbnails/'.$prod->thumbnail):asset('assets/images/noimage.png') }}" alt=""></a>
                                                        <div class="product_action">
                                                            <div class="hover_action">
                                                                <a href="#"><i class="fa fa-plus"></i></a>
                                                                <div class="action_button">
                                                                    <ul>
                                                                        <li style="display:none;"><a title="add to cart" href="#"><i class="fa fa-shopping-basket" aria-hidden="true"></i></a></li>
                                                                        @if (Auth::guard('web')->check())																		<li>																			<a href="javascript:;" title="Add to Wishlist" class="add-to-wish" data-href="{{ route('user-wishlist-add',$prod->id) }}"><i class="fa fa-heart-o" aria-hidden="true"></i></a>																		</li>																		@else																		<li>																			<a href="{{route('user.login')}}" title="Add to Wishlist" class="add-to-wis" ><i class="fa fa-heart-o" aria-hidden="true"></i></a>																		</li>																																				@endif
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="quick_button">
                                                            <a href="javascript:;" data-toggle="modal" data-target="#quickview" data-href="{{ route('product.quick',$prod->id) }}" title="quick_view" class="quick-view">+ quick view</a>
                                                        </div>
                                                    </div>
                                                    <div class="product_content">
                                                        <h3><a href="{{ route('front.product', $prod->slug) }}">{{ $prod->showName() }}</a></h3>
                                                        <span class="current_price">{{ $prod->showPrice() }}</span>
                                                    </div>
                                                </div>
                                            </div>
											@endforeach											
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="Anklet" role="tabpanel">
                                <div class="product_container">
                                    <div class="container">
                                        <div class="row">
                                            @foreach($trending_products as $prod)
											<div class="col-md-4">
                                                <div class="single_product">
                                                    <div class="product_thumb">
                                                        <a class="primary_img" href="{{ route('front.product', $prod->slug) }}"><img src="{{ $prod->thumbnail ? asset('assets/images/thumbnails/'.$prod->thumbnail):asset('assets/images/noimage.png') }}" alt=""></a>
                                                        <div class="product_action">
                                                            <div class="hover_action">
                                                                <a href="#"><i class="fa fa-plus"></i></a>
                                                                <div class="action_button">
                                                                    <ul>
                                                                        <li style="display:none;"><a title="add to cart" href="#"><i class="fa fa-shopping-basket" aria-hidden="true"></i></a></li>
                                                                        @if (Auth::guard('web')->check())																		<li>																			<a href="javascript:;" title="Add to Wishlist" class="add-to-wish" data-href="{{ route('user-wishlist-add',$prod->id) }}"><i class="fa fa-heart-o" aria-hidden="true"></i></a>																		</li>																		@else																		<li>																			<a href="{{route('user.login')}}" title="Add to Wishlist" class="add-to-wis" ><i class="fa fa-heart-o" aria-hidden="true"></i></a>																		</li>																																				@endif
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="quick_button">
                                                            <a href="javascript:;" data-toggle="modal" data-target="#quickview" data-href="{{ route('product.quick',$prod->id) }}" title="quick_view" class="quick-view">+ quick view</a>
                                                        </div>
                                                    </div>
                                                    <div class="product_content">
                                                        <h3><a href="{{ route('front.product', $prod->slug) }}">{{ $prod->showName() }}</a></h3>
                                                        <span class="current_price">{{ $prod->showPrice() }}</span>
                                                    </div>
                                                </div>
                                            </div>
											@endforeach                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="Pendants" role="tabpanel">
                                <div class="product_container">
                                    <div class="container">
                                        <div class="row">
                                            @foreach($sale_products as $prod)
											<div class="col-md-4">
                                                <div class="single_product">
                                                    <div class="product_thumb">
                                                        <a class="primary_img" href="{{ route('front.product', $prod->slug) }}"><img src="{{ $prod->thumbnail ? asset('assets/images/thumbnails/'.$prod->thumbnail):asset('assets/images/noimage.png') }}" alt=""></a>
                                                        <div class="product_action">
                                                            <div class="hover_action">
                                                                <a href="#"><i class="fa fa-plus"></i></a>
                                                                <div class="action_button">
                                                                    <ul>
                                                                        <li style="display:none;"><a title="add to cart" href="#"><i class="fa fa-shopping-basket" aria-hidden="true"></i></a></li>
                                                                        @if (Auth::guard('web')->check())																		<li>																			<a href="javascript:;" title="Add to Wishlist" class="add-to-wish" data-href="{{ route('user-wishlist-add',$prod->id) }}"><i class="fa fa-heart-o" aria-hidden="true"></i></a>																		</li>																		@else																		<li>																			<a href="{{route('user.login')}}" title="Add to Wishlist" class="add-to-wis" ><i class="fa fa-heart-o" aria-hidden="true"></i></a>																		</li>																																				@endif
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="quick_button">
                                                            <a href="javascript:;" data-toggle="modal" data-target="#quickview" data-href="{{ route('product.quick',$prod->id) }}" title="quick_view" class="quick-view">+ quick view</a>
                                                        </div>
                                                    </div>
                                                    <div class="product_content">
                                                        <h3><a href="{{ route('front.product', $prod->slug) }}">{{ $prod->showName() }}</a></h3>
                                                        <span class="current_price">{{ $prod->showPrice() }}</span>
                                                    </div>
                                                </div>
                                            </div>
											@endforeach                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-12">
                    <div class="banner_area">
                        <div class="banner_thumb">
                            <a href="{{ $ps->best_seller_banner_link1 }}"><img src="{{asset('assets/images/'.$ps->best_seller_banner1)}}" alt="#"></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--product section area end-->

