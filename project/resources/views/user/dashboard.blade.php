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
                                <li>my account</li>
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
                                <div class="tab-pane fade show active" id="dashboard">
                                    <h3>Account Information</h3>
									<h5 class="title">{{ $user->name }}</h5>
									<ul class="list">
										<li><p><span class="user-title">{{ $langg->lang209 }}:</span> {{ $user->email }}</p></li>
										@if($user->phone != null)
											<li><p><span class="user-title">{{ $langg->lang210 }}:</span> {{ $user->phone }}</p></li>
										@endif
										@if($user->fax != null)
											<li><p><span class="user-title">{{ $langg->lang211 }}:</span> {{ $user->fax }}</p></li>
										@endif
										@if($user->city != null)
											<li><p><span class="user-title">{{ $langg->lang212 }}:</span> {{ $user->city }}</p></li>
										@endif
										@if($user->zip != null)
											<li><p><span class="user-title">{{ $langg->lang213 }}:</span> {{ $user->zip }}</p></li>
										@endif
										@if($user->address != null)
											<li><p><span class="user-title">{{ $langg->lang214 }}:</span> {{ $user->address }}</p></li>
										@endif
									</ul>
									<h3 style="margin-top: 25px;">Recent Orders</h3>
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
											 @foreach(Auth::user()->orders()->latest()->take(5)->get() as $order)
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
        </section>
        <!-- my account end   -->
@endsection

@section('scripts')
	<script type="text/javascript">
		$('#example').DataTable({
			"paging":   true,
			"ordering": false,
			"info":     true
		});
	</script>
@endsection