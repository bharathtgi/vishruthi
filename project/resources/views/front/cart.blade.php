@extends('layouts.vishruthi')
@section('content')
        <!--breadcrumbs area start-->
        <div class="breadcrumbs_area other_bread">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="breadcrumb_content">
                            <ul>
                                <li><a href="{{ route('front.index') }}">home</a></li>
                                <li>/</li>
                                <li>cart</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--breadcrumbs area end-->

        <!--shopping cart area start -->
        <div class="shopping_cart_area">
            <div class="container">
                
                    <div class="row">
                        <div class="col-12">
                            <div class="table_desc">
                                <div class="cart_page table-responsive">
                                    @if(Session::has('cart'))
									<table>
                                        <thead>
                                            <tr>
                                                <th class="product_remove">Delete</th>
                                                <th class="product_thumb">Image</th>
                                                <th class="product_name">Product</th>
                                                <th class="product-price">Price</th>
                                                <th class="product_quantity">Quantity</th>
                                                <th class="product_total">Total</th>
                                            </tr>
                                        </thead>
                                        <tbody>
											
												@php
													$discount = 0;
												@endphp												
												@foreach($products as $product)
													
														@if(isset($product['discount1']))															$discount += $product['discount1'];														@endif
																											<?php
														$temp_item_id = str_replace(".","dot",$product['item']['id'].$product['size'].$product['color'].$product['chaintype'].$product['banglesize'].str_replace(str_split(' ,'),'',$product['values']));													?>											
													<tr class="cremove{{ $temp_item_id }}" >
														<td class="product_remove">
															<a href="javascript:;" class="removecart cart-remove" data-class="cremove{{ $temp_item_id }}" data-href="{{ route('product.cart.remove',$product['item']['id'].$product['size'].$product['color'].$product['chaintype'].$product['banglesize'].str_replace(str_split(' ,'),'',$product['values'])) }}"><i class="fa fa-trash-o"></i></a>
														</td>
														<td class="product_thumb">
															<a href="{{ route('front.product', $product['item']['slug']) }}"><img src="{{ $product['item']['photo'] ? asset('assets/images/products/'.$product['item']['photo']):asset('assets/images/noimage.png') }}" alt="" style="width:100px;" /></a>
														</td>
														<td class="product_name">
															<a href="{{ route('front.product', $product['item']['slug']) }}">{{mb_strlen($product['item']['name'],'utf-8') > 35 ? mb_substr($product['item']['name'],0,35,'utf-8').'...' : $product['item']['name']}}</a>
															@if(!empty($product['chaintype']))
																<br/><b>Chain Type</b> : {{$product['chaintype']}}
															@endif
															@if(!empty($product['banglesize']))
																<br/><b>Bangle Size</b> : {{$product['banglesize']}}
															@endif															
														</td>
														<td class="product-price">{{ App\Models\Product::convertPrice($product['item_price']) }}</td>
														<td class="product_quantity">
															<div class="qty">
																<ul>
																	<input type="hidden" class="prodid" value="{{$product['item']['id']}}">  
																	<input type="hidden" class="itemid" value="{{$product['item']['id'].$product['size'].$product['color'].$product['chaintype'].$product['banglesize'].str_replace(str_split(' ,'),'',$product['values'])}}">
																	<input type="hidden" class="tempitemid" value="{{$temp_item_id}}">																	
																	<input type="hidden" class="size_qty" value="{{$product['size_qty']}}">     
																	<input type="hidden" class="size_price" value="{{$product['size_price']}}">   
																	<li><span class="qtminus1 reducing" style="cursor: pointer;"><i class="fa fa-minus"></i></span></li>
																	<li><span class="qttotal1" id="qty{{$temp_item_id}}">{{ $product['qty'] }}</span></li>
																	<li><span class="qtplus1 adding" style="cursor: pointer;"><i class="fa fa-plus"></i></span></li>
																</ul>
															</div>
														</td>
														@if($product['size_qty'])
														<input type="hidden" id="stock{{$product['item']['id'].$product['size'].$product['color'].$product['chaintype'].$product['banglesize'].str_replace(str_split(' ,'),'',$product['values'])}}" value="{{$product['size_qty']}}">
														@elseif($product['item']['type'] != 'Physical') 
														<input type="hidden" id="stock{{$product['item']['id'].$product['size'].$product['color'].$product['chaintype'].$product['banglesize'].str_replace(str_split(' ,'),'',$product['values'])}}" value="1">
														@else
														<input type="hidden" id="stock{{$product['item']['id'].$product['size'].$product['color'].$product['chaintype'].$product['banglesize'].str_replace(str_split(' ,'),'',$product['values'])}}" value="{{$product['stock']}}">
														@endif														
														<td class="product_total total-price">                              
															<p id="prc{{$temp_item_id}}">
																{{ App\Models\Product::convertPrice($product['price']) }}                 
															</p>
														</td>
													</tr>
												@endforeach
											
										</tbody>
                                    </table>
									@else
									Cart Empty
									@endif
                                </div>
                                <!--<div class="cart_submit">
                                    <button type="submit">update cart</button>
                                </div>-->
                            </div>
                        </div>
                    </div>

                    <!--coupon code area start-->
                    @if(Session::has('cart'))
					<div class="coupon_area">
                        <div class="row">
                            <div class="col-lg-6 col-md-6">
                                <div class="coupon_code left">
                                    <h3>Coupon</h3>
                                    <div class="coupon_inner">
                                        <p>Enter your coupon code if you have one.</p>
                                        <form id="coupon-form" class="coupon" >
											<input type="text" placeholder="{{ $langg->lang133 }}" id="code" required="" autocomplete="off">
											<input type="hidden" class="coupon-total" id="grandtotal" value="{{ Session::has('cart') ? App\Models\Product::convertPrice($mainTotal) : '0.00' }}">
											<button type="submit">Apply coupon</button>
										</form>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6">
                                <div class="coupon_code right">
                                    <h3>Cart Totals</h3>
                                    <div class="coupon_inner">
                                        <div class="cart_subtotal">
                                            <p>Subtotal</p>
                                            <p class="cart-total">{{ Session::has('cart') ? App\Models\Product::convertPrice($totalPrice+ $discount) : '0.00' }}</p>
                                        </div>
										@if($tax_amount != 0)
                                        <div class="cart_subtotal">
                                            <p>Tax({{$tx}}%)</p>
											<p class="tax-amt">{{ App\Models\Product::convertPrice($tax_amount)}}</p>
                                        </div>	
										@endif
                                        <div class="cart_subtotal">
                                            <p>Discount</p>
											<p class="discount">{{ App\Models\Product::convertPrice(0)}}</p>
											<input type="hidden" id="d-val" value="{{ App\Models\Product::convertPrice(0)}}">
                                        </div>
                                        <!--<a href="#">Calculate shipping</a>-->

                                        <div class="cart_subtotal">
                                            <p>Total</p>
                                            <p class="main-total">{{ Session::has('cart') ? App\Models\Product::convertPrice($mainTotal) : '0.00' }}</p>
                                        </div>
                                        <div class="checkout_btn">
                                            <a href="{{ route('front.checkout') }}">Proceed to Checkout</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
					@endif
                    <!--coupon code area end-->
                
            </div>
        </div>
        <!--shopping cart area end -->

@endsection


