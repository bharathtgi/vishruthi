@if (count($prods) > 0)
	@foreach ($prods as $key => $prod)
	<div class="col-lg-4 col-md-4 col-12">
		<div class="single_product">
			<div class="product_thumb">
				<a class="primary_img" href="{{ route('front.product', $prod->slug) }}"><img src="{{filter_var($prod->photo, FILTER_VALIDATE_URL) ?$prod->photo:asset('assets/images/products/'.$prod->photo)}}" alt="" /></a>
				<!--<a class="secondary_img" href="product-details.html"><img src="{{asset('assets/front/vishruthi/img/product/product23.jpg')}}" alt="" /></a>-->
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
										<a  href="javascript:;"  title="Add to Wishlist" class="add-to-wish" data-href="{{ route('user-wishlist-add',$prod->id) }}">
										<i class="fa fa-heart-o" aria-hidden="true"></i></a>
									</li>								
								@else								
									<li>
										<a  href="{{route('user.login')}}"  title="Add to Wishlist" class="add-to-wis" ><i class="fa fa-heart-o" aria-hidden="true"></i></a>
									</li>								
								@endif
								<li style="display:none;">
									<a href="compare.html" title="Add to Compare"><i class="fa fa-sliders" aria-hidden="true"></i></a>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="quick_button">
					<a href="javascript:;" data-toggle="modal" data-target="#quickview" data-href="{{ route('product.quick',$prod->id) }}" title="quick_view" class="quick-view">+ quick view</a>
				</div>
				<?php					$date1 = new DateTime($prod->created_at);					$date2 = new DateTime(date("Y-m-d H:i:s"));					$difference = $date1->diff($date2);					if (($difference->y == 0) && ($difference->m == 0) && ($difference->d < 10)){						echo '<div class="label_product"><span>new</span></div>';					}				?>
			</div>

			<div class="product_content grid_content">
				<h3><a href="product-details.html">{{ $prod->showName() }}</a></h3>
				<span class="current_price">{{ $prod->setCurrency() }}</span>
			</div>

			<div class="product_content list_content">
				<h3><a href="{{ route('front.product', $prod->slug) }}">{{ $prod->showName() }}</a></h3>
				<div class="product_ratting">
					<ul>
						<li>
							<a href="#"><i class="fa fa-star"></i></a>
						</li>
						<li>
							<a href="#"><i class="fa fa-star"></i></a>
						</li>
						<li>
							<a href="#"><i class="fa fa-star"></i></a>
						</li>
						<li>
							<a href="#"><i class="fa fa-star"></i></a>
						</li>
						<li>
							<a href="#"><i class="fa fa-star"></i></a>
						</li>
					</ul>
				</div>
				<div class="product_price">
					<span class="current_price">{{ $prod->setCurrency() }}</span>
					<span class="old_price">{{ $prod->showPreviousPrice() }}</span>
				</div>
				<div class="product_desc">
					<p>
						{{mb_substr(strip_tags($prod->details), 0, 236,"UTF-8")}}
					</p>
				</div>
			</div>
		</div>
	</div>
	@endforeach
	<div class="col-lg-12 shop_toolbar t_bottom">
		<div class="page-center">
			{!! $prods->appends(['search' => request()->input('search')])->links() !!}
		</div>
	</div>
	<div class="shop_toolbar t_bottom" style="display:none;">
		<div class="pagination">
			<ul>
				<li class="current">1</li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li class="next"><a href="#">next</a></li>
				<li><a href="#">>></a></li>
			</ul>
		</div>
	</div>
@else
	<div class="col-lg-12">
		<div class="page-center">
			 <h4 class="text-center">{{ $langg->lang60 }}</h4>
		</div>
	</div>
@endif	