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
                                <li>Forgot Password</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--breadcrumbs area end-->

        <!-- customer login start -->
        <div class="customer_login">
            <div class="container">
                <div class="row">
                    <!--login area start-->
                    <div class="col-lg-6 col-md-6">
                        <div class="account_form signin-form">
                            <h2>Forgot Password</h2>
							@include('includes.admin.form-login')
							<form id="forgotform" action="{{route('user-forgot-submit')}}" method="POST">
                                {{ csrf_field() }}
								<p>
                                    <label>Email <span>*</span></label>
                                    <input type="email" name="email" placeholder="{{ $langg->lang193 }}" required="" />
                                </p>
                                <div class="login_submit">
                                    <a href="{{ route('user.login') }}">Login?</a>
                                    <input class="authdata" type="hidden" value="{{ $langg->lang195 }}">                                   
									<button type="submit" class="submit-btn">{{ $langg->lang196 }}</button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!--login area start-->
				</div>
            </div>
        </div>
        <!-- customer login end -->

@endsection