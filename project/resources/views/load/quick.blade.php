	<div class="container">
		<div class="row">
			<div class="col-lg-5 col-md-5 col-sm-12">
				<div class="modal_tab">
					<div class="tab-content product-details-large">
						<div class="tab-pane fade show active" id="tab1" role="tabpanel">
							<div class="modal_tab_img">
								<a href="{{filter_var($product->photo, FILTER_VALIDATE_URL) ?$product->photo:asset('assets/images/products/'.$product->photo)}}">
									<img src="{{filter_var($product->photo, FILTER_VALIDATE_URL) ?$product->photo:asset('assets/images/products/'.$product->photo)}}" alt="">
								</a>
							</div>
						</div>
						<?php $i =1;
						foreach($product->galleries as $gal) {  $i = $i+1; ?>			
						<div class="tab-pane fade" id="tab<?php echo $i; ?>" role="tabpanel">
							<div class="modal_tab_img">
								<a href="{{asset('assets/images/galleries/'.$gal->photo)}}">
									<img src="{{asset('assets/images/galleries/'.$gal->photo)}}" alt="">
								</a>
							</div>
						</div>						
						<?php } ?>
					</div>
					<div class="modal_tab_button">
						<ul class="nav product_navactive owl-carousel-quick" role="tablist">
							<li>
								<a id="thumbnil1" onclick="removeActive(this)" class="nav-link active" data-toggle="tab" href="#tab1" role="tab" aria-controls="tab1" aria-selected="true">
									<img src="{{filter_var($product->photo, FILTER_VALIDATE_URL) ?$product->photo:asset('assets/images/products/'.$product->photo)}}" alt="">
								</a>
							</li><?php $i =1;
							foreach($product->galleries as $gal) { $i = $i+1; ?>
							<li>
								<a id="thumbnil<?php echo $i; ?>" onclick="removeActive(this)" class="nav-link " data-toggle="tab" href="#tab<?php echo $i; ?>" role="tab" aria-controls="tab<?php echo $i; ?>" aria-selected="false">
									<img src="{{asset('assets/images/galleries/'.$gal->photo)}}" alt="">
								</a>
							</li>							
							<?php } ?>
						</ul>
					</div>
				</div>
			</div>

			<div class="col-lg-7 col-md-7 col-sm-12">
				<div class="modal_right">
					<div class="modal_title mb-10">
						<h2>{{ $product->name }}</h2>
					</div>
					<div class="modal_price mb-10">
						<span class="new_price">{{ $product->showPrice() }}</span>
						<span class="old_price">{{ $product->showPreviousPrice() }}</span>
					</div>
					<div class="modal_description mb-15">
						<p>{{mb_substr(strip_tags($product->details), 0, 236,"UTF-8")}}</p>
					</div>
					<div class="variants_selects">
						@if(!empty($product->chaintype))
						<div class="variants_size">
							<h2>Chain Type</h2>
							<select class="select_option form-control" id="chaintype" name="chaintype">
								<?php $chaintype = explode(",",$product->chaintype); ?>
								@foreach($chaintype as $key => $data1)
									<option value="{{ $chaintype[$key] }}">{{ $chaintype[$key] }}</option>
								@endforeach
						   </select>
						</div>
						@else
						<input type="hidden" id="chaintype" name="chaintype">						
						@endif
						@if(!empty($product->banglesize))
						<div class="variants_color">
							<h2>Bangles Sizes</h2>
							<select class="select_option form-control" id="banglesize" name="banglesize">
							   <?php $banglesize = explode(",",$product->banglesize); ?>
								@foreach($banglesize as $key => $data1)
									<option value="{{ $banglesize[$key] }}">{{ $banglesize[$key] }}</option>
								@endforeach
						   </select>
						</div>
						@else
						<input type="hidden" id="banglesize" name="banglesize">
						@endif
						<div class="modal_add_to_cart">
							<ul class="meta-list">
							@if($product->product_type != "affiliate")
								<li class="count {{ $product->type == 'Physical' ? '' : 'd-none' }}">
									@php
										$stck = (string)$product->stock;
									@endphp
									
									<div class="qty">
										<ul>
											<li><span class="modal-minus" style="cursor: pointer;"><i class="fa fa-minus"></i></span></li>
											<li><span class="modal-total qttotal">1</span></li>
											<li><span class="modal-plus" style="cursor: pointer;"><i class="fa fa-plus"></i></span></li>
										</ul>
									</div>
									
								</li>
							@endif							
							</ul>
							
							<a href="javascript:;" id="maddcrt" ><i class="icofont-cart"></i>{{ $langg->lang90 }}</a>
							
							<!--<form action="#">
								<input min="0" max="100" step="2" value="1" type="number">
								<button type="submit">add to cart</button>
							</form>-->
							
						</div>
					</div>
					<div class="modal_social" style="display:none;">
						<h2>Share this product</h2>
						<ul>
							<li class="facebook"><a href="#"><i class="fa fa-facebook"></i></a></li>
							<li class="pinterest"><a href="#"><i class="fa fa-instagram"></i></a></li>
							<li class="google-plus"><a href="#"><i class="fa fa-whatsapp"></i></a></li>
						</ul>
					</div>
				</div>
			</div>

		</div>
	</div>

		@if($stck != null)
			<input type="hidden" class="product-stock"  value="{{ $stck }}">	
		@else
			<input type="hidden" class="product-stock" value="">
		@endif		
		<input type="hidden" id="mproduct_id" value="{{ $product->id }}">
	
	
	<script type="text/javascript">
		function removeActive (input){ 
			var tid = $(input).attr('id');
			var idArray = [];
			$('.nav-link').each(function () {
				idArray.push(this.id);
			});
			var i;
			for (i = 0; i < idArray.length; ++i) {
				if (tid !== idArray[i]){ 
					$( "#"+idArray[i] ).removeClass( "active" );
				} 
			}
		}
		var sizes = "";
		var size_qty = "";
		var size_price = "";
		var size_key = "";
		var colors = "";
		var mtotal = "";
		var mstock = $('.product-stock').val();
		var keys = "";
		var values = "";
		var prices = "";

		$('.modal-minus').on('click', function () {
			var el = $(this);
			var $tselector = el.parent().parent().find('.modal-total');
			total = $($tselector).text();
			if (total > 1) {
			  total--;
			}
			$($tselector).text(total);
		});

		$('.modal-plus').on('click', function () {
			var el = $(this);
			var $tselector = el.parent().parent().find('.modal-total');
			total = $($tselector).text();
			var mstock = $('.product-stock').val();
			if(mstock != ""){
				var stk = parseInt(mstock);
				if(total < stk)  {
					total++;
					$($tselector).text(total);
				}
			}	else {
				total++;
			}
			$($tselector).text(total);
		});
		$("#maddcrt").on("click", function(){
			var qty = $('.modal-total').html();
			var pid = $("#mproduct_id").val();
			var chaintype = $("#chaintype").val();
			var banglesize = $("#banglesize").val();
			$.ajax({
				type: "GET",
				url:mainurl+"/addnumcart",
				data:{id:pid,qty:qty,size:sizes,color:colors,size_qty:size_qty,size_price:size_price,size_key:size_key,keys:keys,values:values,prices:prices,chaintype:chaintype,banglesize:banglesize},
				success:function(data){
					if(data == 'digital') {
						toastr.error(langg.already_cart);
					}
					else if(data == 0) {
						toastr.error(langg.out_stock);
					}
					else {
						$("#cart-count").html(data[0]);
						$("#cart-items").load(mainurl+'/carts/view');
						var mstock = $('.product-stock').val();
						var remainng_stock = parseInt(mstock) - parseInt(qty);
						if (remainng_stock < 1){
							$('.product-stock').val('0');
							$('.qty').css('display','none');
							$('#maddcrt').css('display','none');
						} else {
							$('.product-stock').val(remainng_stock);
						}
						$('.modal-total').html('1');
						toastr.success(langg.add_cart);
					}
				}
			});
		});		
	</script>	