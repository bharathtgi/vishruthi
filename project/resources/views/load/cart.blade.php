@if(Session::has('cart'))	
	@foreach(Session::get('cart')->items as $product)
	<div class="cart_item top">
		<div class="cart_img">
			<a href="{{ route('front.product',$product['item']['slug']) }}">
				<img src="{{ $product['item']['photo'] ? filter_var($product['item']['photo'], FILTER_VALIDATE_URL) ?$product['item']['photo']:asset('assets/images/products/'.$product['item']['photo']):asset('assets/images/noimage.png') }}" alt="">
			</a>
		</div>
		<div class="cart_info">
			<a href="{{ route('front.product',$product['item']['slug']) }}">{{mb_strlen($product['item']['name'],'utf-8') > 45 ? mb_substr($product['item']['name'],0,45,'utf-8').'...' : $product['item']['name']}}</a>
			@if(!empty($product['chaintype']))
				<span>Chain Type : {{$product['chaintype']}}</span>
			@endif
			@if(!empty($product['banglesize']))
				<span>Bangle Size : {{$product['banglesize']}}</span>
			@endif			
			<span>{{$product['qty']}}x {{ App\Models\Product::convertPrice($product['item_price']) }}</span>
		</div>
		<div class="cart_remove">
			<a href="javascript:;" class="cart-remove" data-class="cremove{{ $product['item']['id'].$product['size'].$product['color'].$product['chaintype'].$product['banglesize'].str_replace(str_split(' ,'),'',$product['values']) }}" 
				data-href="{{ route('product.cart.remove',$product['item']['id'].$product['size'].$product['color'].$product['chaintype'].$product['banglesize'].str_replace(str_split(' ,'),'',$product['values'])) }}">
				<i class="ion-android-close"></i>
			</a>
		</div>
	</div>
	@endforeach
	<div class="cart__table">
		<table>
			<tbody>
				<tr>
					<td class="text-left">Sub-Total :</td>
					<td class="text-right">{{ Session::has('cart') ? App\Models\Product::convertPrice(Session::get('cart')->totalPrice) : '0.00' }}</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="cart_button view_cart">
		<a href="{{ route('front.cart') }}">View Cart</a>
	</div>
	<div class="cart_button checkout">
		<a href="{{ route('front.checkout') }}">Checkout</a>
	</div>
@else
	<p >{{ $langg->lang8 }}</p>
@endif