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