@extends('layouts.vishruthi')
@section('content')
	<!--breadcrumbs area start-->
	<div class="breadcrumbs_area other_bread">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="breadcrumb_content">
						<ul>
							<li><a href="{{route('front.index')}}">home</a></li>
							<li>/</li>
							<li>wishlist</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--breadcrumbs area end-->

	<!--wishlist area start -->
	<div class="wishlist_area">
		<div class="container">
			<form action="#">
				<div class="row">
					<div class="col-12">
						<div class="table_desc wishlist">
							<div class="cart_page table-responsive">
								@if(count($wishlists))
								<table>
									<thead>
										<tr>
											<th class="product_remove">Delete</th>
											<th class="product_thumb">Image</th>
											<th class="product_name">Product</th>
											<th class="product-price">Price</th>
											<th class="product_quantity">Stock Status</th>
											<th class="product_total">View</th>
										</tr>
									</thead>
									<tbody>
										@foreach($wishlists as $wishlist)
										<tr>
											<td class="product_remove">
												<a href="javascript:;" class="wishlist-remove" data-href="{{ route('user-wishlist-remove',$wishlist->id) }}">X</a>
											</td>
											<td class="product_thumb">
												<a href="{{ route('front.product', $wishlist->product->slug) }}">
												<img style="width: 100px;" src="{{ $wishlist->product->photo ? asset('assets/images/products/'.$wishlist->product->photo):asset('assets/images/noimage.png') }}" alt="" /></a>
											</td>
											<td class="product_name"><a href="{{ route('front.product', $wishlist->product->slug) }}">{{ $wishlist->product->name }}</a></td>
											<td class="product-price">{{ $wishlist->product->showPrice() }}</td>
											<td class="product_quantity">In Stock</td>
											<td class="product_total"><a href="{{ route('front.product', $wishlist->product->slug) }}">view</a></td>
										</tr>
										@endforeach
									</tbody>
								</table>
								<div class="col-lg-12 shop_toolbar t_bottom page-center">
									{{ $wishlists->appends(['sort' => $sort])->links() }}
								</div>								
								@else
									No Products were Found
								@endif
							</div>
							
						</div>

					</div>
				</div>
			</form>
			<div class="row" style="display:none;">
				<div class="col-12">
					<div class="wishlist_share">
						<h4>Share on:</h4>
						<ul>
							<li>
								<a href="#"><i class="fa fa-rss"></i></a>
							</li>
							<li>
								<a href="#"><i class="fa fa-vimeo"></i></a>
							</li>
							<li>
								<a href="#"><i class="fa fa-tumblr"></i></a>
							</li>
							<li>
								<a href="#"><i class="fa fa-pinterest"></i></a>
							</li>
							<li>
								<a href="#"><i class="fa fa-linkedin"></i></a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--wishlist area end -->
@endsection