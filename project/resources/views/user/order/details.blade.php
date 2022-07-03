@extends('layouts.vishruthi')

@section('styles')
<link rel="stylesheet" href="{{asset('assets/front/vishruthi/css/order-page.css')}}" />
@endsection

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
                                <li>orders</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--breadcrumbs area end-->

        <!-- my account start  -->
        <section class="main_content_area">
            <div class="container">
                <div class="account_dashboard">
                    <div class="row">
                        @include('includes.user-dashboard-sidebar')
                        <div class="col-sm-12 col-md-9 col-lg-9">
                            <div class="order-detail">
                                <!-- Tab panes -->
                                <div class="order">
                                    <h2>Order Details</h2>
                                    <div class="order-id">
                                        <h3>Order# {{$order->order_number}} [{{$order->status}}]</h3>
                                        <div class="ordered-details row">
                                            <div class="col-md-6">
												<ul>
													<li><span>Order Date</span>: {{date('d-M-Y',strtotime($order->created_at))}}</li>
													<li><span>Payment Status</span>: 
														@if ($order->payment_status == 'Pending')
															Pending
														@else
															Paid
														@endif
													</li>
													<li><span>Paid Amount</span>: {{$order->currency_sign}}{{ round($order->pay_amount * $order->currency_value , 2) }}</li>
												</ul>
											</div>
											<div class="col-md-6">
												<ul>
													
													<li><span>Payment Method</span>: {{$order->method}}</li>
													<li><span>Razorpay Transaction ID</span>: {{$order->txnid}}</li>
												</ul>											
											</div>
                                        </div>
                                    </div>

                                    <div class="order-id">
                                        <h3>Shipping /  Billing Details</h3>
                                        <div class="ordered-details row">
                                            <div class="col-md-6">
												<ul>
													<li><span>Name</span>: {{$order->shipping_name == null ? $order->customer_name : $order->shipping_name}}</li>
													<li><span>Email</span>: {{$order->shipping_email == null ? $order->customer_email : $order->shipping_email}}</li>
													<li><span>Phone</span>: {{$order->shipping_phone == null ? $order->customer_phone : $order->shipping_phone}}</li>
													<li style="line-height: 20px;"><span>Address</span>: 
														{{$order->shipping_address == null ? $order->customer_address : $order->shipping_address}}<br/>
														{{$order->shipping_city == null ? $order->customer_city : $order->shipping_city}}-{{$order->shipping_zip == null ? $order->customer_zip : $order->shipping_zip}}
													</li>
												</ul>
											</div>
											<div class="col-md-6">
												<ul>
													<li><span>Name</span>: {{$order->customer_name}}</li>
													<li><span>Email</span>: {{$order->customer_email}}</li>
													<li><span>Phone</span>: {{$order->customer_phone}}</li>
													<li style="line-height: 20px;"><span>Address</span>: No.12 New Colony, Chrompet qwqwqw-12121{{$order->customer_address}}<br/>
														{{$order->customer_city}}-{{$order->customer_zip}}
													</li>
													
												</ul>											
											</div>
											@if($order->order_note != null)
											<ul>
												<li><span>Order Note</span>: {{$order->order_note}}</li>
											</ul>
											@endif
                                        </div>
                                    </div>
                                    <div class="order-table">
                                        <h5>Ordered Products</h5>
                                        <div class="table-responsive">
                                            <table class="table table-bordered veiw-details-table">
												<thead>
													<tr>
														<th width="45%">Name</th>
														<th width="25%">Details</th>
														<th>Price</th>
														<th>Total</th>
													</tr>
												</thead>
												@php 
												$subtotal = 0; 
												@endphp                                                
												<tbody>
													@foreach($cart['items'] as $product)
													<tr>
														<td>{{ $product['item']['name'] }}</td>
														<td>
															{{ $langg->lang311 }}: {{$product['qty']}}
															@if(!empty($product['chaintype']))
																<br/>Chain Type: {{$product['chaintype']}}
															@endif
															
															@if(!empty($product['banglesize']))
																<br/>Bangle Size: {{$product['banglesize']}}
															@endif
														</td>
														<td>{{$order->currency_sign}}{{round($product['item_price'] * $order->currency_value,2)}}</td>
														<td>{{$order->currency_sign}}{{number_format((float)($product['price'] * $order->currency_value), 2, '.', '')}}</td>
														@php 
														$subtotal += round($product['price'] * $order->currency_value, 2);
														@endphp														
													</tr>
													@endforeach
													<tr >
														<td colspan="3" class="right">Sub Total</td>
														<td >{{$order->currency_sign}}{{ number_format((float)($subtotal), 2, '.', '') }}</td>
													</tr>
													@if(($order->tax_amount != '') && ($order->tax_amount != NULL) && ($order->tax_amount != 0))
													<tr >
														<td colspan="3" class="right">Tax</td>
														<td >{{$order->currency_sign}}{{number_format((float)($order->tax_amount), 2, '.', '')}}</td>
													</tr>
													@endif
													@if(($order->coupon_discount != '') && ($order->coupon_discount != NULL) && ($order->coupon_discount != 0))
													<tr >
														<td colspan="3" class="right">Coupon Discount</td>
														<td >{{$order->currency_sign}}{{number_format((float)($order->coupon_discount), 2, '.', '')}}</td>
													</tr>
													@endif													
													<tr>
														<td colspan="3" class="right">Total</td>
														<td >{{$order->currency_sign}}{{ number_format((float)($order->pay_amount * $order->currency_value) , 2, '.', '') }}</td>
													</tr>
												</tbody>
											</table>
											<div class="row">
                                                <div class="col-md-12">
                                                    <div class="total"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="edit-account-info-div">
                                        <div class="form-group">
                                            <a class="back-btn" href="{{ route('user-orders') }}">Back</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- my account end   -->

@endsection