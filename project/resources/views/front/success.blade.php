@extends('layouts.vishruthi')

@section('styles')
<link rel="stylesheet" href="{{asset('assets/front/vishruthi/css/order-page.css')}}" />
@endsection


@section('content')
	<div class="customer_login cart" style="padding-top: 0px;">
		<div class="container">
			<div class="row">
				<div class="col-md-12 text-center">
					<div class="icon">
						<i class="fa fa-check"></i>
					</div>
					<div class="thankyou-content">
						<h1 style="font-size: 40px;">Thank you for your Purchase</h1>
						<p>Order# <strong>{{$order->order_number}}</strong></p>
						<p style="margin-bottom: 25px;">Order Date {{date('d-M-Y',strtotime($order->created_at))}}</p>
						<a href="{{route('front.index')}}">Back To Home</a>
						<div class="row" style="margin-top: 35px;" >
							<div class="col-md-6">
								<p><strong>Shipping Address</strong></p>
								<p>{{ $langg->lang288 }} {{$order->shipping_name == null ? $order->customer_name : $order->shipping_name}}</p>
								<p>{{ $langg->lang289 }} {{$order->shipping_email == null ? $order->customer_email : $order->shipping_email}}</p>
								<p>{{ $langg->lang290 }} {{$order->shipping_phone == null ? $order->customer_phone : $order->shipping_phone}}</p>
								<p>{{ $langg->lang291 }} {{$order->shipping_address == null ? $order->customer_address : $order->shipping_address}}<br/>
									{{$order->shipping_city == null ? $order->customer_city : $order->shipping_city}}-{{$order->shipping_zip == null ? $order->customer_zip : $order->shipping_zip}}</p>
							</div>
							<div class="col-md-6">
								<p><strong>Billing Address</strong></p>
								<p>{{ $langg->lang288 }} {{$order->customer_name}}</p>
								<p>{{ $langg->lang289 }} {{$order->customer_email}}</p>
								<p>{{ $langg->lang290 }} {{$order->customer_phone}}</p>
								<p>{{ $langg->lang291 }} {{$order->customer_address}}<br/>{{$order->customer_city}}-{{$order->customer_zip}}</p>							
							</div>							
						</div><br/><br/>
						<p><strong>Ordered Products</strong></p>
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
									@foreach($tempcart['items'] as $product)
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
				</div>
			</div>
		</div>
	</div>
</div>
@endsection