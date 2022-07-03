@extends('layouts.vishruthi')
@section('content')
	<!--breadcrumbs area start-->
	<div class="breadcrumbs_area product_bread">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="breadcrumb_content">
						<ul>
							<li><a href="{{ route('front.index') }}">home</a></li>
							<li>/</li>
							<li><a href="{{route('front.category',$productt->category->slug)}}">{{$productt->category->name}}</a></li>
							@if($productt->subcategory_id != null)
								<li>/</li>
								<li><a href="{{ route('front.subcat',['slug1' => $productt->category->slug, 'slug2' => $productt->subcategory->slug]) }}">
										{{$productt->subcategory->name}}
									</a>
								</li>
							@endif							
							<li>/</li><li><a href="{{ route('front.product', $productt->slug) }}">{{ $productt->name }}</a>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--breadcrumbs area end-->
	
	<!--product details start-->
	<div class="product_details">
		<div class="container">
			<div class="row">
				<div class="col-lg-5 col-md-5">
					<div class="product-details-tab">
						<div id="img-1" class="zoomWrapper single-zoom">
							<a href="#">
								<img id="zoom1" src="{{filter_var($productt->photo, FILTER_VALIDATE_URL) ?$productt->photo:asset('assets/images/products/'.$productt->photo)}}" 
								data-zoom-image="{{filter_var($productt->photo, FILTER_VALIDATE_URL) ?$productt->photo:asset('assets/images/products/'.$productt->photo)}}" alt="big-1" />
							</a>
						</div>

						<div class="single-zoom-thumb">
							<ul class="s-tab-zoom owl-carousel single-product-active" id="gallery_01">
								<li>
									<a href="#" class="elevatezoom-gallery active" data-update="" data-image="{{filter_var($productt->photo, FILTER_VALIDATE_URL) ?$productt->photo:asset('assets/images/products/'.$productt->photo)}}" 
											data-zoom-image="{{filter_var($productt->photo, FILTER_VALIDATE_URL) ?$productt->photo:asset('assets/images/products/'.$productt->photo)}}">
										<img src="{{filter_var($productt->photo, FILTER_VALIDATE_URL) ?$productt->photo:asset('assets/images/products/'.$productt->photo)}}" alt="zo-th-1" />
									</a>
								</li>								
								@foreach($productt->galleries as $gal)
								<li>
									<a href="#" class="elevatezoom-gallery active" data-update="" data-image="{{asset('assets/images/galleries/'.$gal->photo)}}" data-zoom-image="{{asset('assets/images/galleries/'.$gal->photo)}}">
										<img src="{{asset('assets/images/galleries/'.$gal->photo)}}" alt="zo-th-1" />
									</a>
								</li>
								@endforeach
							</ul>
						</div>
					</div>
				</div>
				<div class="col-lg-7 col-md-7">
					<div class="product_d_right">
						<form action="#">
							<h1>{{ $productt->name }}</h1>
							@if( $productt->sku != null )
							<h4 style="font-size: 13px;font-weight: 500;">Product SKU : {{ $productt->sku }}</h4>
							@endif
							<div class="info-meta-1">
                    <ul>

                      @if($productt->type == 'Physical')
                      @if($productt->emptyStock())
                      <li class="product-outstook">
                        <p>
                          <i class="icofont-close-circled"></i>
                          {{ $langg->lang78 }}
                        </p>
                      </li>
                      @else
                     
                      @endif
                      @endif
                      <li>
                        <div class="ratings">
                          <div class="empty-stars"></div>
                          <div class="full-stars" style="width:{{App\Models\Rating::ratings($productt->id)}}%"></div>
                        </div>
                      </li>
                      <li class="review-count">
                        <p>{{count($productt->ratings)}} {{ $langg->lang80 }}</p>
                      </li>
                  @if($productt->product_condition != 0)
                     <li>
                       <div class="{{ $productt->product_condition == 2 ? 'mybadge' : 'mybadge1' }}">
                        {{ $productt->product_condition == 2 ? 'New' : 'Used' }}
                       </div>
                     </li>
                  @endif
                    </ul>
                  </div>
							<div class="modal_price mb-10">
								<span class="new_price">{{ $productt->showPrice() }}</span>
								<span class="old_price">{{ $productt->showPreviousPrice() }}</span>
							</div>
							<div class="product_desc">
								{!! $productt->details !!}
							</div>
							@if(!empty($productt->chaintype))
							<div class="product_variant color">
								<h3>Chain Type</h3>
								<select class="niceselect_option" id="chaintype" name="chaintype">
									<?php $chaintype = explode(",",$productt->chaintype); ?>
									@foreach($chaintype as $key => $data1)
										<option value="{{ $chaintype[$key] }}">{{ $chaintype[$key] }}</option>
									@endforeach
								</select>
							</div>
							@else
							<input type="hidden" id="chaintype" name="chaintype">
							@endif
							@if(!empty($productt->banglesize))
							<div class="product_variant color">
								<h3>Bangles size</h3>
								<select class="niceselect_option" id="banglesize" name="banglesize">
									<?php $banglesize = explode(",",$productt->banglesize); ?>
									@foreach($banglesize as $key => $data1)
										<option value="{{ $banglesize[$key] }}">{{ $banglesize[$key] }}</option>
									@endforeach
								</select>
							</div>
							@else
							<input type="hidden" id="banglesize" name="banglesize">
							@endif
							@php
								$stck = (string)$productt->stock;
							@endphp							
							
							<li class="d-block count {{ $productt->type == 'Physical' ? '' : 'd-none' }}">
								<div class="qty">
								    
									<ul>
									    <li><label>Quantity</label></li>
										<li><span class="qtminus" style="cursor: pointer;"><i class="fa fa-minus"></i></span></li>
										<li><span class="qttotal">1</span></li>
										<li><span class="qtplus"style="cursor: pointer;"><i class="fa fa-plus"></i></span></li>
									</ul>
								</div>
							</li>
							<li class="addtocart">
								<a href="javascript:;" id="addcrt"><i class="icofont-cart"></i>{{ $langg->lang90 }}</a>
							</li>
							
							@if($stck != null)
								<input type="hidden" id="stock"  value="{{ $stck }}">	
							@else
								<input type="hidden" id="stock" value="">
							@endif	
							<input type="hidden" id="product_id" value="{{ $productt->id }}">
							<!--<div class="product_variant quantity">
								<label>quantity</label>
								<input min="1" max="100" value="1" type="number" />
								<button class="button" type="submit">add to cart</button>
							</div>-->
							<div class="product_d_action">
								<ul>
									@if(Auth::guard('web')->check())
									<li>
										<a href="javascript:;" class="add-to-wish" data-href="{{ route('user-wishlist-add',$productt->id) }}"><i class="fa fa-heart-o" aria-hidden="true"></i> Add to Wish List</a>
									</li>
									@else
									<li>
										<a href="{{route('user.login')}}" class="add-to-wis" ><i class="fa fa-heart-o" aria-hidden="true"></i> Add to Wish List</a>
									</li>									
									@endif
								</ul>
							</div>
						</form>
						<div class="priduct_social" style="display:none;">
							<h3>Share on:</h3>
							<ul>
								<li>
									<a href="" class="facebook a2a_button_facebook"><i class="fa fa-facebook"></i></a>
								</li>
								<li>
									<a href="#"><i class="fa fa-instagram"></i></a>
								</li>
								<li>
									<a href="#"><i class="fa fa-whatsapp"></i></a>
								</li>
								
							</ul>
						</div>
                            <!-- Start  Product Details Social Area-->
                            <div class=" priduct_social product-details-social social-links social-sharing a2a_kit a2a_kit_size_32">
                                <h3>Share on:</h3>
                                <ul class="link-list social-links">
                                    <li>
                                        <a href="#" class="facebook a2a_button_facebook"><i class="fa fa-facebook"></i></a>
                                    </li>
                                    <li>
                                        <a href="#" class="twitter a2a_button_twitter"><i class="fa fa-twitter"></i></a>
                                    </li>
                                    <li>
                                        <a href="#" class="pinterest a2a_button_pinterest" ><i class="fa fa-pinterest"></i></a>
                                    </li>
                                    <li style="display:none;">
                                        <a href="#"><i class="fa fa-google-plus"></i></a>
                                    </li>
                                    <li>
                                        <a href="#" class="linkedin a2a_button_linkedin"><i class="fa fa-linkedin"></i></a>
                                    </li>	
                                     <li>
                                        <a href="#" class="whatsapp a2a_button_whatsapp"><i class="fa fa-whatsapp"></i></a>
                                    </li>	
                                </ul>
                            </div>
							<script async src="https://static.addtoany.com/menu/page.js"></script>		

					</div>
				</div>
			</div>
		</div>
	</div>
	<!--product details end-->

	<!--product info start-->
	<div class="product_d_info">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="product_d_inner">
						<div class="product_info_button">
							<ul class="nav" role="tablist">
								<li>
									<a class="active" data-toggle="tab" href="#info" role="tab" aria-controls="info" aria-selected="false">Description</a>
								</li>
								<li>
									<a  data-toggle="tab" href="#addinfo" role="tab" aria-controls="addinfo" aria-selected="false">Additional Info</a>
								</li>								
								<li>
									<a  data-toggle="tab" href="#sheet" role="tab" aria-controls="sheet" aria-selected="false">Buy & Return Policy</a>
								</li>
								<li>
									<a data-toggle="tab" href="#reviews" role="tab" aria-controls="reviews" aria-selected="false">Reviews({{ count($productt->ratings) }})</a>
								</li>
							</ul>
						</div>
						<div class="tab-content">
							<div class="tab-pane fade show active" id="info" role="tabpanel">
								<div class="product_info_content">
									<p>{!! $productt->tab_desc !!}</p>
								</div>
							</div>
							<div class="tab-pane fade show " id="addinfo" role="tabpanel">
								<div class="product_info_content">
									<p>{!! $productt->add_info !!}</p>
								</div>
							</div>
							<div class="tab-pane fade show " id="sheet" role="tabpanel">
								<div class="product_info_content">
									<p>{!! $productt->policy !!}</p>
								</div>
							</div>
							<div class="tab-pane fade" id="reviews" role="tabpanel">
								<div class="product_info_content">
									<h4>Ratings & Reviews</h4>
									<span id="star-rating">{{App\Models\Rating::rating($productt->id)}}</span>
								</div>
								<div id="reviews-section">
									@if(count($productt->ratings) > 0)
										@foreach($productt->ratings as $review)
											<div class="product_info_inner">
												<div class="product_ratting mb-10">
													<ul>
														<li><a href="javascript:;" ><i class="fa fa-star"></i></a></li>
														<li><a href="javascript:;" <?php if ($review->rating > 1 ) { ?> <?php } else { ?> style="color:#ddd;" <?php } ?> ><i class="fa fa-star"></i></a></li>
														<li><a href="javascript:;" <?php if ($review->rating > 2 ) { ?> <?php } else { ?> style="color:#ddd;" <?php } ?> ><i class="fa fa-star"></i></a></li>
														<li><a href="javascript:;" <?php if ($review->rating > 3 ) { ?> <?php } else { ?> style="color:#ddd;" <?php } ?> ><i class="fa fa-star"></i></a></li>
														<li><a href="javascript:;" <?php if ($review->rating > 4 ) { ?> <?php } else { ?> style="color:#ddd;" <?php } ?>  ><i class="fa fa-star"></i></a></li>
													</ul>
													<strong>{{ $review->user->name }}</strong>
													<p>{{ Carbon\Carbon::createFromFormat('Y-m-d H:i:s',$review->review_date)->diffForHumans() }}</p>
												</div>
												<div class="product_demo">
													<p>{{$review->review}}</p>
												</div>
											</div>
										@endforeach
									@else
										<p>{{ $langg->lang97 }}</p>
									@endif
								</div>
								<div >
									<div class="review-area" <?php if(!Auth::guard('web')->check()) { ?> style="display:none;" <?php } ?> >
										<div class="star-area">
											<ul class="star-list">
												<li>
												    <i class="fa fa-star stars" id="starone" data-val="1"></i>
												    <i class="fa fa-star stars" id="startwo" data-val="2"></i>
												    <i class="fa fa-star stars" id="starthree" data-val="3"></i>
												    <i class="fa fa-star stars" id="starfour" data-val="4"></i>
												    <i class="fa fa-star stars" id="starfive" data-val="5"></i>
												</li>
											</ul>
										</div>
										<div class="product_review_form write-comment-area">
											<div class="gocover" style="background: url({{ asset('assets/images/'.$gs->loader) }}) no-repeat scroll center center rgba(45, 45, 45, 0.5);"></div>
											<form id="reviewform" action="{{route('front.review.submit')}}" data-href="{{ route('front.reviews',$productt->id) }}" method="POST">
												<h2>Add a review</h2>
												@include('includes.admin.form-both')
												{{ csrf_field() }}
												<input type="hidden" id="rating" name="rating" value="5">
												<input type="hidden" name="user_id" value="<?php if(Auth::guard('web')->check()) { echo Auth::guard('web')->user()->id; } ?>">
												<input type="hidden" name="product_id" value="{{$productt->id}}">
												<div class="row">
													<div class="col-12">
														<textarea name="review" placeholder="{{ $langg->lang99 }}" required=""></textarea>
													</div>
												</div>
												<button type="submit">Submit</button>
											</form>
										</div>
									</div>
									@if(!Auth::guard('web')->check()) 
									<div class="checkout_info signin-form" >
										<?php
										if (Cookie::get('vishruthi_user_email') !== null) {
											$prefilled_email = Cookie::get('vishruthi_user_email');
											$prefilled_password = Cookie::get('vishruthi_user_pass');
										} else {
											$prefilled_email = "";
											$prefilled_password = "";
										}
										?>
										@include('includes.admin.form-login')                                    
										<form class="mloginform" action="{{ route('user.login.submit') }}" method="POST">
											{{ csrf_field() }}
											<input type="hidden" name="redirect_to" id="redirect_to" value="productreview">
											<div class="row">
												<div class="form_group col-6">
													<label>Email <span>*</span></label>
													<input type="email" name="email" placeholder="{{ $langg->lang173 }}" required="" value="<?php echo $prefilled_email; ?>"  />
												</div>
												<div class="form_group col-6">
													<label>Password <span>*</span></label>
													<input type="password" class="Password" name="password" placeholder="{{ $langg->lang174 }}" required=""  value="<?php echo $prefilled_password; ?>" />
												</div>
											</div>
											<div class="form_group group_3">
												<button type="submit">Login</button>
												<label for="remember_box">
													<input name="remember" id="mrp" {{ old('remember') ? 'checked' : '' }} type="checkbox" />
													<span> Remember me </span>
												</label>
											</div>
											<input class="mauthdata" type="hidden" value="{{ $langg->lang177 }}">										
											<a href="{{ route('user-forgot') }}">Lost your password?</a>
										</form>										
									</div>
									@endif
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--product info end-->

	<!--product section area start-->
	<section class="product_section related_product">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="section_title">
						<h2>Related Products</h2>
						<p>Contemporary, minimal and modern designs embody the Lavish Alice handwriting</p>
					</div>
				</div>
			</div>
			<div class="product_area">
				<div class="row">
					<div class="product_carousel product_three_column4 owl-carousel">
						@foreach($productt->category->products()->where('status','=',1)->where('id','!=',$productt->id)->take(8)->get() as $prod)
						<div class="col-lg-3">
							<div class="single_product">
								<div class="product_thumb">
									<a class="primary_img" href="{{ route('front.product', $prod->slug) }}"><img src="{{ $prod->thumbnail ? asset('assets/images/thumbnails/'.$prod->thumbnail):asset('assets/images/noimage.png') }}" alt="" /></a>
									<!--<a class="secondary_img" href="product-details.html"><img src="{{asset('assets/front/vishruthi/img/product/product28.jpg')}}" alt="" /></a>-->
									<div class="product_action">
										<div class="hover_action">
											<a href="#"><i class="fa fa-plus"></i></a>
											<div class="action_button">
												<ul>
													<!--<li>
														<a title="add to cart" href="cart.html"><i class="fa fa-shopping-basket" aria-hidden="true"></i></a>
													</li>-->
													@if (Auth::guard('web')->check())
													<li>
														<a href="javascript:;" title="Add to Wishlist" class="add-to-wish" data-href="{{ route('user-wishlist-add',$prod->id) }}"><i class="fa fa-heart-o" aria-hidden="true"></i></a>
													</li>
													@endif
													<li>
														<a href="compare.html" title="Add to Compare"><i class="fa fa-sliders" aria-hidden="true"></i></a>
													</li>
												</ul>
											</div>
										</div>
									</div>
									<div class="quick_button">
										<a href="#" data-toggle="modal" data-target="#modal_box" title="quick_view" 
										data-href="{{ route('product.quick',$prod->id) }}" class="detail-quick-view">+ quick view</a>
									</div>
								</div>
								<div class="product_content">
									<h3><a href="product-details.html">{{ $prod->showName() }}</a></h3>
									<span class="current_price">{{ $prod->showPrice() }}</span>
								</div>
							</div>
						</div>
						@endforeach
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--product section area end-->
        <!-- modal area start-->
        <div class="modal fade" id="modal_box" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
					<div class="submit-loader">
						<img src="{{asset('assets/images/'.$gs->loader)}}" alt="">
					</div>                    
					<div class="modal_body quick-view-modal">

                    </div>
                </div>
            </div>
        </div>
        <!-- modal area start-->	
@endsection


@section('scripts')
	<script type="text/javascript">
		$(document).on('click', '.detail-quick-view', function(){
			var $this = $("#modal_box");
			$this.find('.modal-header').hide();
			$this.find('.modal-body').hide();
			$this.find('.modal-content').css('border','none');
			$('.submit-loader').show();
			$(".quick-view-modal").load($(this).data('href'),function(response, status, xhr){
				if(status == "success"){
					$('.submit-loader').hide();
					$this.find('.modal-header').show();
					$this.find('.modal-body').show();
					$('.product_navactive').owlCarousel({
						loop: false,
						dots: false,
						margin: 10,
						nav: true,
						navText: [
							"<i class='fa fa-caret-left'></i>",
							"<i class='fa fa-caret-right'></i>"
						],
						autoplay: true,
						autoplayHoverPause: true,
						responsive: {
							0: {
								items: 1
							},
							600: {
								items: 3
							},
							1000: {
								items: 5
							}
						}
					});				
				}
			});
			return false;
		});		
	</script>
@endsection