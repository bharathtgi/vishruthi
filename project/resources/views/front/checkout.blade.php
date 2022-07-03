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
                                <li>checkout</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--breadcrumbs area end-->

        <!--Checkout page section-->
        <div class="Checkout_section" id="accordion">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        @if(!Auth::guard('web')->check())
						<div class="user-actions">
                            <div id="checkout_login" class="collapse" data-parent="#accordion">
                                <div class="checkout_info signin-form">
                                    <p>If you have shopped with us before, please enter your details in the boxes below. If you are a new customer please proceed to the Billing & Shipping section.</p>
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
										<input type="hidden" name="redirect_to" id="redirect_to" value="checkout">
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
										<input type="hidden" name="modal" value="1">
										<input class="mauthdata" type="hidden" value="{{ $langg->lang177 }}">										
                                        <a href="{{ route('user-forgot') }}">Lost your password?</a>
                                    </form>
                                </div>
                            </div>
                        </div>
						@endif
                        <div class="user-actions">
                            <div id="checkout_coupon" class="collapse" data-parent="#accordion">
                                <div class="checkout_info">
                                    <form id="check-coupon-form" >
                                        <input placeholder="Coupon code" type="text" id="code" required="" autocomplete="off" />
                                        <button type="submit">Apply coupon</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="checkout_form">
                    <form id="" action="{{route('razorpay.submit')}}" method="POST" class="checkoutform">
						@include('includes.form-success')
						@include('includes.form-error')
						{{ csrf_field() }}					
						<div class="row">
							<input type="hidden" id="shipping-cost" name="shipping_cost" value="0">
							<input type="hidden" id="packing-cost" name="packing_cost" value="0">
							<input type="hidden" name="dp" value="{{$digital}}">
							<input type="hidden" name="tax" value="{{$gs->tax}}">
							<input type="hidden" name="totalQty" value="{{$totalQty}}">
							<input type="hidden" name="vendor_shipping_id" value="{{ $vendor_shipping_id }}">
							<input type="hidden" name="vendor_packing_id" value="{{ $vendor_packing_id }}">
							@if(Session::has('coupon_total'))
								<input type="hidden" name="total" id="grandtotal" value="{{ $totalPrice }}">
								<input type="hidden" id="tgrandtotal" value="{{ $totalPrice }}">
							@elseif(Session::has('coupon_total1'))
								<input type="hidden" name="total" id="grandtotal" value="{{ preg_replace("/[^0-9,.]/", "", Session::get('coupon_total1') ) }}">
								<input type="hidden" id="tgrandtotal" value="{{ preg_replace("/[^0-9,.]/", "", Session::get('coupon_total1') ) }}">
							@else
								<input type="hidden" name="total" id="grandtotal" value="{{round($totalPrice * $curr->value,2)}}">
								<input type="hidden" id="tgrandtotal" value="{{round($totalPrice * $curr->value,2)}}">
							@endif
							<input type="hidden" id="ttotal" value="{{ Session::has('cart') ? App\Models\Product::convertPrice(Session::get('cart')->totalPrice) : '0' }}">
							<input type="hidden" name="coupon_code" id="coupon_code" value="{{ Session::has('coupon_code') ? Session::get('coupon_code') : '' }}">
							<input type="hidden" name="coupon_discount" id="coupon_discount" value="{{ Session::has('coupon') ? Session::get('coupon') : '' }}">
							<input type="hidden" name="coupon_id" id="coupon_id" value="{{ Session::has('coupon') ? Session::get('coupon_id') : '' }}">
							<input type="hidden" name="user_id" id="user_id" value="{{ Auth::guard('web')->check() ? Auth::guard('web')->user()->id : '' }}">
							<input type="hidden" name="method" id="pay_method" value="Razorpay">
							<input type="hidden" name="tax_amount" id="tax_amount" value="{{$tax_amount}}">
							<div class="col-lg-6 col-md-6">
								<h3>Billing Details</h3>
								<div class="row">
									<select class="form-control" id="shipop" name="shipping" required="" style="display:none;">
										<option value="shipto">{{ $langg->lang149 }}</option>
										<option value="pickup">{{ $langg->lang150 }}</option>
									</select>									
									<div class="col-lg-6 mb-20">
										<label>Full Name <span>*</span></label>
										<input type="text" name="name" placeholder="{{ $langg->lang152 }}" required="" value="{{ Auth::guard('web')->check() ? Auth::guard('web')->user()->name : '' }}" />
									</div>
									<div class="col-lg-6 mb-20">
										<label>Phone Number <span>*</span></label>
										<input type="text" name="phone" placeholder="{{ $langg->lang153 }}" required="" value="{{ Auth::guard('web')->check() ? Auth::guard('web')->user()->phone : '' }}" />
									</div>
									<div class="col-12 mb-20">
										<label>Email</label>
										<input type="text" name="email"	placeholder="{{ $langg->lang154 }}" required="" value="{{ Auth::guard('web')->check() ? Auth::guard('web')->user()->email : '' }}" />
									</div>

									<div class="col-12 mb-20">
										<label>Street address <span>*</span></label>
										<input type="text" name="address" placeholder="{{ $langg->lang155 }}" required="" value="{{ Auth::guard('web')->check() ? Auth::guard('web')->user()->address : '' }}" />
									</div>
									<div class="col-12 mb-20">
										<label for="country">Country <span>*</span></label>
										<select class="niceselect_option" name="customer_country" required="">
											@include('includes.countries')
										</select>
									</div>									
									<div class="col-6 mb-20">
										<label>Town / City <span>*</span></label>
										<input type="text" name="city" placeholder="{{ $langg->lang158 }}" required="" value="{{ Auth::guard('web')->check() ? Auth::guard('web')->user()->city : '' }}" />
									</div>
									<div class="col-6 mb-20">
										<label>Postal Code <span>*</span></label>
										<input type="text" name="zip" placeholder="{{ $langg->lang159 }}" required="" value="{{ Auth::guard('web')->check() ? Auth::guard('web')->user()->zip : '' }}" />
									</div>
									<!--<div class="col-12 mb-20">
										<input id="account" type="checkbox" data-target="createp_account" />
										<label for="account" data-toggle="collapse" data-target="#collapseOne" aria-controls="collapseOne">Create an account?</label>

										<div id="collapseOne" class="collapse one" data-parent="#accordion">
											<div class="card-body1">
												<label> Account password <span>*</span></label>
												<input placeholder="password" type="password" />
											</div>
										</div>
									</div>-->
									<div class="col-12 mb-20">
										<input id="ship-diff-address" type="checkbox" value="value1" data-target="createp_account" />
										<label class="righ_0" for="address" >Ship to a different address?</label>
										<div class="ship-diff-addres-area d-none" >
											<div class="row">
												<div class="col-lg-6 mb-20">
													<label>{{ $langg->lang152 }} <span>*</span></label>
													<input type="text" name="shipping_name" id="shippingFull_name" placeholder="{{ $langg->lang152 }}" />
												</div>
												<div class="col-lg-6 mb-20">
													<label>{{ $langg->lang153 }} <span>*</span></label>
													<input type="text" name="shipping_phone" id="shipingPhone_number" placeholder="{{ $langg->lang153 }}" />
												</div>
												<div class="col-12 mb-20">
													<div class="select_form_select">
														<label for="countru_name">country <span>*</span></label>
														<select class="niceselect_option" name="shipping_country">
															@include('includes.countries')
														</select>
													</div>
												</div>
												<div class="col-12 mb-20">
													<label>Street address <span>*</span></label>
													<input placeholder="House number and street name" type="text" name="shipping_city"	id="shipping_city" placeholder="{{ $langg->lang158 }}" />
												</div>
												<div class="col-lg-6 mb-20">
													<label>{{ $langg->lang158 }}<span>*</span></label>
													<input type="text" name="shipping_city" id="shipping_city" placeholder="{{ $langg->lang158 }}" />
												</div>
												<div class="col-lg-6">
													<label> {{ $langg->lang159 }} <span>*</span></label>
													<input type="text" name="shipping_zip"	id="shippingPostal_code" placeholder="{{ $langg->lang159 }}" />
												</div>
											</div>
										</div>
									</div>
									<div class="col-12">
										<div class="order-notes">
											<label for="order_note">Order Notes</label>
											<textarea id="order_note" placeholder="Notes about your order, e.g. special notes for delivery." name="order_notes" ></textarea>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-6 col-md-6">
								<h3>Your order</h3>
								<div class="order_table table-responsive">
									<table>
										<thead>
											<tr>
												<th>Product</th>
												<th>Total</th>
											</tr>
										</thead>
										<tbody>
											@foreach($products as $product)
											<tr>
												<td>{{ $product['item']['name'] }} <strong> × {{ $product['qty'] }}</strong>
													@if(!empty($product['chaintype']))
														<br/><b>Chain Type</b> : {{$product['chaintype']}}
													@endif
													@if(!empty($product['banglesize']))
														<br/><b>Bangle Size</b> : {{$product['banglesize']}}
													@endif													
												</td>
												<td>{{ $curr->sign }}{{ number_format((float)($product['price']), 2, '.', '') }}</td>
											</tr>
											@endforeach
										</tbody>
										<tfoot>
											<tr>
												<th>Cart Subtotal</th>
												<td class="cart-total">{{ Session::has('cart') ? $curr->sign.number_format((float)(Session::get('cart')->totalPrice), 2, '.', '') : '0.00' }}</td>
											</tr>
											@if($gs->tax != 0)
											<tr>
												<th>{{ $langg->lang144 }} ({{$gs->tax}}%)</th>
												<td>{{ $curr->sign }}{{$tax_amount}}</td>
											</tr>											
											@endif
											
											<tr id="coupon_tr" <?php if(Session::has('coupon')) { ?>   <?php } else { ?> style="display:none;" <?php } ?> >
												<th>Coupon Discount</th>
												<td id="coupon_discount_price">
												{{ $curr->sign.number_format((float)(Session::get('coupon')), 2, '.', '') }}
												</td>
											</tr>
											
											<tr class="order_total">
												<th>Order Total</th>
												<td><strong id="final-cost">{{ $curr->sign }}{{ $totalPrice }}</strong></td>
											</tr>
										</tfoot>
									</table>
								</div>
								<div class="payment_method">
                                    @if($gs->cod_check == 1)
									<div class="panel-default" style="display:none;">
										<input id="payment_cod" name="check_method" type="radio" data-target="createp_account" class="payment_method" />
										<label for="payment_cod" >{{ $langg->lang762 }} </label>
										<div id="collapsedefult" class="collapse one" data-parent="#accordion">
											<div class="card-body1">
												@if($gs->cod_text != null)
												<p>{{ $gs->cod_text }}</p>
												@endif
											</div>
										</div>
									</div>
									@endif
									@if($gs->is_razorpay == 1)
									<div class="panel-default">
										<input id="payment_razorpay" name="check_method" type="radio" data-target="createp_account" class="payment_method" checked />
										<label for="payment_razorpay" >{{ $langg->razorpay }} </label>
										<div id="collapsedefult" class="collapse one" data-parent="#accordion">
											<div class="card-body1">
												@if($gs->razorpay_text != null)
												<p>{{ $gs->razorpay_text }}</p>
												@endif
											</div>
										</div>
									</div>									
									@endif									
									<div class="order_button">
										<button type="submit">Proceed to Pay</button>
									</div>
								</div>
							</div>
						</div>
					</form>
                </div>
            </div>
        </div>
        <!--Checkout page section end-->
@endsection

@section('scripts')
	<script type="text/javascript">
		var pos = {{ $gs->currency_format }};
		$("#ship-diff-address").on( "change", function() {
            if(this.checked){
				$('.ship-diff-addres-area').removeClass('d-none');  
				$('.ship-diff-addres-area input, .ship-diff-addres-area select').prop('required',true); 
            } else {
				$('.ship-diff-addres-area').addClass('d-none');  
				$('.ship-diff-addres-area input, .ship-diff-addres-area select').prop('required',false);  
            }
        });
		$("#check-coupon-form").on('submit', function () {
			var val = $("#code").val();
			var total = $("#ttotal").val();
			var ship = 0;
			$.ajax({
				type: "GET",
				url:mainurl+"/carts/coupon/check",
				data:{code:val, total:total, shipping_cost:ship},
				success:function(data){
					if(data == 0)	{
						toastr.error(langg.no_coupon);
						$("#code").val("");
					} else if(data == 2)	{
						toastr.error(langg.already_coupon);
						$("#code").val("");
					}	else	{
						//$("#check-coupon-form").toggle();
						$("#code").val("");
						//$(".discount-bar").removeClass('d-none');
						if(pos == 0){
							//$('#final-cost').html('{{ $curr->sign }}'+data[0]);
							var coupon_price = Math.round(data[2]).toFixed(2);
							$('#coupon_discount_price').html('{{ $curr->sign }}'+ data[2]);
							$('#coupon_tr').css('display','contents');
						}	else{
							//$('#final-cost').html(data[0]+'{{ $curr->sign }}');
							var coupon_price = Math.round(data[2]).toFixed(2);
							$('#coupon_discount_price').html(data[2] +'{{ $curr->sign }}');
							$('#coupon_tr').css('display','contents');
						}
						$('#grandtotal').val(data[0]);
						$('#tgrandtotal').val(data[0]);
						$('#coupon_code').val(data[1]);
						$('#coupon_discount').val(data[2]);
						$('#coupon_id').val(data[3]);
/* 						if(data[4] != 0){
							$('.dpercent').html('('+data[4]+')');
						}	else{
							$('.dpercent').html('');									
						} */
						//var ttotal = parseFloat($('#grandtotal').val()) + parseFloat(mship) + parseFloat(mpack);
						var ttotal = parseFloat($('#grandtotal').val())
						ttotal = parseFloat(ttotal);
						if(ttotal % 1 != 0)  {
							ttotal = ttotal.toFixed(2);
						}
						if(pos == 0){
							Math.round(ttotal).toFixed(2);
							$('#final-cost').html('{{ $curr->sign }}'+ttotal)
						} else{
							Math.round(ttotal).toFixed(2);
							$('#final-cost').html(ttotal+'{{ $curr->sign }}')
						}	
						toastr.success(langg.coupon_found);
						$("#code").val("");
					}
				}
			}); 
			return false;
		});		
	</script>
@endsection	