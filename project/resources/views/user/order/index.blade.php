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
                                <li>Orders</li>
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
                            <!-- Tab panes -->
                            <div class="tab-content dashboard_content">
                                <div class="tab-pane fade show active" id="orders">
                                    <h3>Orders</h3>
									<div class="table-responsiv">
										<table id="example" class="table table-hover dt-responsive" cellspacing="0" width="100%">
											<thead>
												<tr>
													<th>{{ $langg->lang278 }}</th>
													<th>{{ $langg->lang279 }}</th>
													<th>{{ $langg->lang280 }}</th>
													<th>{{ $langg->lang281 }}</th>
													<th>{{ $langg->lang282 }}</th>
												</tr>
											</thead>
											<tbody>
												 @foreach($orders as $order)
												<tr>
													<td>
															{{$order->order_number}}
													</td>
													<td>
															{{date('d M Y',strtotime($order->created_at))}}
													</td>
													<td>
															{{$order->currency_sign}}{{ round($order->pay_amount * $order->currency_value , 2) }}
													</td>
													<td>
														<div class="order-status {{ $order->status }}">
																{{ucwords($order->status)}}
														</div>
													</td>
													<td>
														<a class="mybtn2 sm" href="{{route('user-order',$order->id)}}">
																{{ $langg->lang283 }}
														</a>
													</td>
												</tr>
												@endforeach
											</tbody>
										</table>
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

@section('scripts')
	<script type="text/javascript">
		$('#example').DataTable({
			"paging":   true,
			"ordering": true,
			"info":     true
		});
	</script>
@endsection