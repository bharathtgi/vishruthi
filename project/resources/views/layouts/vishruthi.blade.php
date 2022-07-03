<!doctype html>
<html class="no-js" lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	@if(isset($page->meta_tag) && isset($page->meta_description))
        <meta name="keywords" content="{{ $page->meta_tag }}">
        <meta name="description" content="{{ $page->meta_description }}">
		<title>{{$gs->title}}</title>
	@elseif(isset($blog->meta_tag) && isset($blog->meta_description))
        <meta name="keywords" content="{{ $blog->meta_tag }}">
        <meta name="description" content="{{ $blog->meta_description }}">
		<title>{{$gs->title}}</title>
    @elseif(isset($productt))
		<meta name="keywords" content="{{ !empty($productt->meta_tag) ? implode(',', $productt->meta_tag ): '' }}">
		<meta name="description" content="{{ $productt->meta_description != null ? $productt->meta_description : strip_tags($productt->description) }}">
	    <meta property="og:title" content="{{$productt->name}}" />
	    <meta property="og:description" content="{{ $productt->meta_description != null ? $productt->meta_description : strip_tags($productt->description) }}" />
	    <meta property="og:image" content="{{asset('assets/images/thumbnails/'.$productt->thumbnail)}}" />
	    <meta name="author" content="GeniusOcean">
    	<title>{{substr($productt->name, 0,11)."-"}}{{$gs->title}}</title>
    @else
	    <meta name="keywords" content="{{ $seo->meta_keys }}">
	    <meta name="author" content="GeniusOcean">
		<title>{{$gs->title}}</title>
    @endif		
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="{{asset('assets/front/vishruthi/img/fav.png')}}">

    <!-- CSS 
    ========================= -->

    <!-- Plugins CSS -->
    <link rel="stylesheet" href="{{asset('assets/front/vishruthi/css/plugins.css')}}">
    <!-- Main Style CSS -->
    <link rel="stylesheet" href="{{asset('assets/front/vishruthi/css/style.css')}}">
	<!-- Theme CSS START -->
	<link rel="stylesheet" href="{{asset('assets/front/css/toastr.css')}}" />
	@if( (Route::currentRouteName() == 'user-orders') )
	<!--<link rel="stylesheet" href="{{asset('assets/front/css/all.css')}}">-->
	@endif	
	<!-- Theme CSS END -->
	@yield('styles')
</head>
<body>
    <!--Offcanvas menu area start-->
    <div class="off_canvars_overlay">
    </div>
    <div class="offcanvas_menu">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="col-lg-4 col-md-12">
                        <div class="logo">
                            <a href="{{ route('front.index') }}"><img src="{{asset('assets/images/'.$gs->logo)}}" alt=""></a>
                        </div>
                    </div>
                    <div class="canvas_open">
                        <a href="javascript:void(0)"><i class="ion-navicon"></i></a>
                    </div>
                    <div class="offcanvas_menu_wrapper">
                        <div class="canvas_close">
                            <a href="javascript:void(0)"><i class="ion-android-close"></i></a>
                        </div>
                        <div id="menu" class="text-left ">
                            <ul class="offcanvas_main_menu">
                                <li class="menu-item-has-children active">
                                    <a href="{{ route('front.index') }}">Home</a>
                                </li>
								@foreach($categories as $data)
                                <li class="menu-item-has-children">
                                    <a href="{{route('front.category', [$data->slug])}}">{{ $data->name }}</a>
                                    <ul class="sub-menu">
										<?php $subcategories =  App\Models\Subcategory::where('category_id','=',$data->id)->where('status','=','1')->get();
										if (!empty($subcategories)) {
										foreach($subcategories as $subcategory){ ?>
											<li><a href="{{route('front.category', [$data->slug, $subcategory->slug])}}">{{$subcategory->name}}</a></li>
										<?php } } ?>
									</ul>
                                </li>								
								@endforeach
                                <li class="menu-item-has-children">
                                    <a href="#">my account</a>
                                </li>
                                <li class="menu-item-has-children">
                                    <a href="#">About Us</a>
                                </li>
                                <li class="menu-item-has-children">
                                    <a href="#"> Contact Us</a>
                                </li>
                            </ul>
                        </div>
                        <div class="offcanvas_footer">
                            <span><a href="#"><i class="fa fa-envelope-o"></i> info@yourdomain.com</a></span>
                            <ul>
                                <li class="facebook"><a href="#"><i class="fa fa-facebook"></i></a></li>
                                <li class="twitter"><a href="#"><i class="fa fa-twitter"></i></a></li>
                                <li class="pinterest"><a href="#"><i class="fa fa-pinterest-p"></i></a></li>
                                <li class="google-plus"><a href="#"><i class="fa fa-google-plus"></i></a></li>
                                <li class="linkedin"><a href="#"><i class="fa fa-linkedin"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--Offcanvas menu area end-->

    <!--header area start-->
    <header class="header_area">
        <!--header top start-->
        <div class="header_top">
            <div class="container">
                <div class="row align-items-center">
                    <!--<div class="col-lg-4 col-md-12">
                        <div class="welcome_text">
                            <ul>
                                <li><span>Delivery:</span> Delivery mab be delayed due to COVID-19</li>
                            </ul>
                        </div>
                    </div>-->
                    <div class="col-lg-4 col-md-12">
                        <div class="logo">
                            <a href="{{ route('front.index') }}"><img src="{{asset('assets/images/'.$gs->logo)}}" alt=""></a>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-12 text-center">
                    </div>
                    <div class="col-lg-6 col-md-12">
                        <div class="cart_area">
                            @if(Auth::guard('web')->check())
							<div class="wish cart_link">
                                <a href="{{ route('user-wishlists') }}"><i class="fa fa-heart-o"></i></a>
                                <span class="cart-quantity" id="wishlist-count">{{ Auth::user()->wishlistCount() }}</span>
                            </div>
							@else
							<div class="wish cart_link">
                                <a href="javascript:;"><i class="fa fa-heart-o"></i></a>
                                <span class="cart-quantity" id="wishlist-count">0</span>
                            </div>							
							@endif
                            <div class="cart_link wish">
                                <a href="#"><i class="fa fa-shopping-basket"></i></a>
                                <span class="cart-quantity" id="cart-count">{{ Session::has('cart') ? count(Session::get('cart')->items) : '0' }}</span>
                                <!--mini cart-->
                                <div class="mini_cart" id="cart-items">
									@include('load.cart')
                                </div>
                                <!--mini cart end-->
                            </div>
                            <div class="wish cart_link track">
                                <a href="javascript:;" data-toggle="modal" data-target="#trackid" class="track-btn">Track Order</a>
                            </div>
                            <div class="top-header">
                                <div class="content">
                                    <div class="left-content">
                                        <div class="list">
                                            <ul>
                                                <li>
                                                    <div class="currency-selector">
                                                        <!--<span>₹</span>
														<span>{{ Session::has('currency') ?   DB::table('currencies')->where('id','=',Session::get('currency'))->first()->sign   : DB::table('currencies')->where('is_default','=',1)->first()->sign }}<span>-->
                                                        <select id="site_currency" name="currency" class="currency selectors nice" style="display: none;">
															@foreach(DB::table('currencies')->get() as $currency)
																<option value="{{route('front.currency',$currency->id)}}" rel="{{$currency->sign}}" {{ Session::has('currency') ? ( Session::get('currency') == $currency->id ? 'selected' : '' ) : ( $currency->is_default == 1 ? 'selected' : '') }} >{{$currency->name}}</option>
															@endforeach
                                                        </select>
                                                        <div class="nice-select currency selectors nice" tabindex="0">
															<span class="current">{{ Session::has('currency') ?   DB::table('currencies')->where('id','=',Session::get('currency'))->first()->name   : DB::table('currencies')->where('is_default','=',1)->first()->name }}</span>
                                                            <ul class="list">
                                                                @foreach(DB::table('currencies')->get() as $currency)
																<li data-value="{{route('front.currency',$currency->id)}}" class="currency option {{ Session::has('currency') ? ( Session::get('currency') == $currency->id ? 'selected' : '' ) : ( $currency->is_default == 1 ? 'selected' : '') }}">{{$currency->name}}</li>
																@endforeach
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="right-content">
                                        <div class="list">
                                            <ul>												@if(!Auth::guard('web')->check())
                                                <li class="login">                                                    <a href="{{route('user.login')}}" class="sign-log">                                                        <div class="links">                                                            <span class="sign-in">Login</span> <span>|</span>                                                            <span class="join">Register</span>                                                        </div>                                                    </a>                                                </li>												@else													<li class="login">														<a href="{{route('user-dashboard')}}" class="sign-log">															<div class="links">																<span class="sign-in">{{Auth::user()->name}}</span> 															</div>														</a>													</li>															<li class="login">														<a href="javascript:;" class="sign-log">															<div class="links">																<span>|</span>															</div>														</a>													</li>																							<li class="login">														<a href="{{route('user-logout')}}" class="sign-log">															<div class="links">																<span class="sign-in">Logout</span> 															</div>														</a>													</li>																									@endif
                                            </ul>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <!-- Main Wrapper Start -->
                    </div>
                </div>
            </div>
        </div>
        <!--header top start-->

        <!--header middel start-->

        <!--header middel end-->

        <!--header bottom satrt-->
        <div class="header_bottom sticky-header">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-12">
                        <div class="header_static">
                            <div class="main_menu_inner">
                                <div class="main_menu">
                                    <nav>
                                        <ul>
                                            <li class="active"><a href="{{ route('front.index') }}">Home </a>
                                            </li>
                                            @foreach($categories as $data)
											<li >
												<a href="{{route('front.category', [$data->slug])}}">{{ $data->name }} <i class="fa fa-angle-down"></i></a>
                                                <ul class="sub_menu pages">
													<?php $subcategories =  App\Models\Subcategory::where('category_id','=',$data->id)->where('status','=','1')->get();
													if (!empty($subcategories)) {
													foreach($subcategories as $subcategory){ ?>
														<li><a href="{{route('front.category', [$data->slug, $subcategory->slug])}}">{{$subcategory->name}}</a></li>
													<?php } } ?>
                                                </ul>
                                            </li >	
											@endforeach
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--header bottom end-->
    </header>
    <!--header area end-->

	@yield('content')

    <!--footer area start-->
    <footer class="footer_widgets other_widgets">
        <div class="footer_top">
            <div class="container">
                <div class="footer_top_inner">
                    <div class="row">
                        <div class="col-lg-4 col-md-6">
                            <div class="widgets_container contact_us">
                                <?php $contact = App\Models\Pagesetting::where('id','=','1')->first(); ?>
								<h3>Contact Us</h3>
                                <div class="footer_contact">
                                    <img src="{{asset('assets/images/'.$gs->footer_logo)}}" alt="">
                                    <p><b>Address:</b> {!! $contact->street !!}</p>
                                    <p><b>Phone:</b> <a href="tel:{{$contact->phone}}">{{$contact->phone}}</a> </p>
                                    <p><b>Landline:</b> <a href="tel:{{$contact->fax}}">{{$contact->fax}}</a> </p>
                                    <p><b>Email:</b> {{$contact->email}}</p>
                                    <ul>
                                        @if($socialsetting->f_status == 1)
										<li><a href="{{ $socialsetting->facebook }}" target="_blank" title="facebook"><i class="fa fa-facebook"></i></a></li>
                                        @endif
										@if($socialsetting->g_status == 1)
										<li><a href="{{ $socialsetting->gplus }}" target="_blank" title="facebook"><i class="fa fa-google-plus"></i></a></li>
										@endif
										@if($socialsetting->t_status == 1)
										<li><a href="{{ $socialsetting->twitter }}" target="_blank" title="facebook"><i class="fa fa-twitter"></i></a></li>
										@endif										
										@if($socialsetting->l_status == 1)
										<li><a href="{{ $socialsetting->linkedin }}" target="_blank" title="facebook"><i class="fa fa-instagram"></i></a></li>
										@endif
                                    </ul>

                                </div>
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-6 col-sm-6 col-6">
                            <div class="widgets_container">
                                <h3>Information</h3>
                                <div class="footer_menu">
                                    <ul>
										@foreach(DB::table('pages')->where('footer','=',1)->get() as $data)
										<li><a href="{{ route('front.page',$data->slug) }}">{{ $data->title }}</a></li>
										@endforeach
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-6 col-sm-6 col-6">
                            <div class="widgets_container">
                                <h3>Quick Links</h3>
                                <div class="footer_menu">
                                    <ul>
										@if (Auth::guard('web')->check())
										<li><a href="{{ route('user-dashboard') }}">My Account</a></li>
										@else
										<li><a href="{{ route('user.login') }}">Sign In</a></li>
										@endif
                                        <li><a href="{{route('front.contact')}}">Contact Us</a></li>
                                        @if($gs->is_faq == 1)
										<li><a href="{{ route('front.faq') }}">FAQ</a></li>
										@endif
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4 col-md-6">
                            <div class="widgets_container newsletter">
                                <h3>{{$gs->popup_title}}</h3>
                                <div class="newleter-content">
                                    <p>{{$gs->popup_text}}</p>
                                    <div class="subscribe_form">
                                        <!-- mailchimp-alerts Start -->
                                        <div class="mailchimp-alerts text-centre">
                                            <div class="mailchimp-submitting"></div>
                                            <!-- mailchimp-submitting end -->
                                            <div class="mailchimp-success"></div>
                                            <!-- mailchimp-success end -->
                                            <div class="mailchimp-error"></div>
                                            <!-- mailchimp-error end -->
                                        </div>
                                        <!-- mailchimp-alerts end -->                                        
										<form action="{{route('front.subscribe')}}" id="subscribeform" method="POST" class="mc-form footer-newsletter" >
                                            {{csrf_field()}}
											<input id="email" type="email" name="email" autocomplete="off" placeholder="Enter you email address here..." />
                                            <button id="sub-btn" type="submit">Subscribe !</button>
                                        </form>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer_bottom">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <div class="copyright_area">
                            <p> &copy; {{date('Y')}} <strong> Vishruthi Jewel Emporium </strong> Design: <a href="https://www.mindmade.in/" target="_blank">MindMade</a></p>
                        </div>
                    </div>
                    <!--<div class="col-lg-6 col-md-6">
                        <div class="footer_custom_links">
                            <ul>
                                <li><a href="javascript:;">Order History</a></li>
                                <li><a href="javascript:;">Wish List</a></li>
                                <li><a href="javascript:;">Newsletter</a></li>
                            </ul>
                        </div>
                    </div>-->
                </div>
            </div>
        </div>
            <div class="whatsapp_icon">
                <a href="https://api.whatsapp.com/send?phone=+919787155003" target="_blank"><img src="{{asset('assets/front/vishruthi/img/icon/whatsapp-logo.svg')}}" alt="whatsapp-logo" width="42" height="42"></a>
            </div>
    </footer>
    <!--footer area end-->

    <!-- modal area start-->
    <div class="modal fade" id="quickview" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
				<div class="submit-loader">
					<img src="{{asset('assets/images/'.$gs->loader)}}" alt="">
				</div>                
				<div class="modal_body quick-view-modal">
                    
				</div>
            </div>
        </div>
    </div>
    <!-- modal area start-->
    
    <!-- modal area start-->
    <div class="modal fade" id="trackid" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog  modal-lg" role="document">
            <div class="modal-content">
            <div class="modal-header">
                <h6 class="modal-title"> <b>Order Tracking</b> </h6>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">

                        <div class="order-tracking-content">
                            <form id="track-form" class="track-form">
                                {{ csrf_field() }}
                                <input type="text" id="track-code" placeholder="Get Tracking Code" required="">
                                <button type="submit" class="mybtn1">View Tracking</button>
                                <a href="#" data-toggle="modal" data-target="#order-tracking-modal"></a>
                            </form>
                        </div>

                        <div>
				            <div class="submit-loader d-none">
								<img src="{{asset('assets/images/'.$gs->loader)}}" alt="">
							</div>
							<div id="track-order">

							</div>
                        </div>

            </div>
            </div>
        </div>
    </div>
    

    
    <!-- modal area start-->

    <!--<div class="newletter-popup" >
        <div id="boxes" class="newletter-container">
            <div id="dialog" class="window">
                <div id="popup2">
                    <span class="b-close"><span>close</span></span>
                </div>
                <div class="box">
                    <div class="newletter-title">
                        <h2>Newsletter</h2>
                    </div>
                    <div class="box-content newleter-content">
                        <label class="newletter-label">Enter your email address to subscribe our notification of our new post &amp; features by email.</label>
                        <div id="frm_subscribe">
                            <form name="subscribe" id="subscribe_popup">
                                <input type="text" value="" name="subscribe_pemail" id="subscribe_pemail" placeholder="Enter you email address here...">
                                <input type="hidden" value="" name="subscribe_pname" id="subscribe_pname">
                                <div id="notification"></div>
                                <a class="theme-btn-outlined" onclick="email_subscribepopup()"><span>Subscribe</span></a>
                            </form>
                            <div class="subscribe-bottom">
                                <input type="checkbox" id="newsletter_popup_dont_show_again">
                                <label for="newsletter_popup_dont_show_again">Don't show this popup again</label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>-->


    <!-- JS
============================================ -->
	<script type="text/javascript">

	  var mainurl = "{{url('/')}}";

	  var gs      = {!! json_encode(\App\Models\Generalsetting::first()->makeHidden(['stripe_key', 'stripe_secret', 'smtp_pass', 'instamojo_key', 'instamojo_token', 'paystack_key', 'paystack_email', 'paypal_business', 'paytm_merchant', 'paytm_secret', 'paytm_website', 'paytm_industry', 'paytm_mode', 'molly_key', 'razorpay_key', 'razorpay_secret'])) !!};

	  var langg    = {!! json_encode($langg) !!};

	</script>
    <!-- Plugins JS -->
    <script src="{{asset('assets/front/vishruthi/js/plugins.js')}}"></script>
    <!-- Main JS -->
    <script src="{{asset('assets/front/vishruthi/js/main.js')}}"></script>

	<!-- Theme Js START-->
	<script src="{{asset('assets/front/js/jquery.js')}}"></script>
	<script src="{{asset('assets/front/js/vue.js')}}"></script>
	<script src="{{asset('assets/front/jquery-ui/jquery-ui.min.js')}}"></script>
	<!-- popper -->
	<script src="{{asset('assets/front/js/popper.min.js')}}"></script>
	<!-- bootstrap -->
	<script src="{{asset('assets/front/js/bootstrap.min.js')}}"></script>
	<!-- plugin js-->
	<script src="{{asset('assets/front/js/plugin.js')}}"></script>
	<script src="{{asset('assets/front/js/xzoom.min.js')}}"></script>
	<script src="{{asset('assets/front/js/jquery.hammer.min.js')}}"></script>
	<script src="{{asset('assets/front/js/setup.js')}}"></script>
	<script src="{{asset('assets/front/js/toastr.js')}}"></script>
	<!-- main 
	<script src="{{asset('assets/front/js/main.js')}}"></script>-->
	<!-- custom -->
	<script src="{{asset('assets/front/js/custom.js')}}"></script>
	<!-- Theme Js END-->
	<script type="text/javascript">
		$("#trackid").on("hidden.bs.modal", function () { 
			$('#track-form').trigger("reset");
			$("#track-order").html('');
		});	
		$("#quickview").on("hidden.bs.modal", function () {
			$(".quick-view-modal").html('');
		});
	</script>
	@yield('scripts')

</body>

</html>