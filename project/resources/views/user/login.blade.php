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
                                <li>login</li>
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
                            <h2>login</h2>
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
								<p>
                                    <label>Email <span>*</span></label>
                                    <input type="email" name="email" placeholder="{{ $langg->lang173 }}" required="" value="<?php echo $prefilled_email; ?>" />
                                </p>
                                <p>
                                    <label>Password <span>*</span></label>
                                    <input type="password" class="Password" name="password" placeholder="{{ $langg->lang174 }}" required=""  value="<?php echo $prefilled_password; ?>" />
                                </p>
                                <div class="login_submit">
                                    <a href="{{ route('user-forgot') }}">Forgot password?</a>
                                    <label for="remember">
                                        <input name="remember" id="mrp" {{ old('remember') ? 'checked' : '' }} type="checkbox" />
                                        Remember me
                                    </label>
									<input type="hidden" name="modal" value="1">
									<input class="mauthdata" type="hidden" value="{{ $langg->lang177 }}">                                    
									<button type="submit" class="submit-btn">login</button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!--login area start-->

                    <!--register area start-->
                    <div class="col-lg-6 col-md-6">
                        <div class="account_form register">
                            <h2>Register</h2>
                            @include('includes.admin.form-login')
							<form class="mregisterform" action="{{route('user-register-submit')}}" method="POST">
								{{ csrf_field() }}
                                <p>
                                    <label>Full Name <span>*</span></label>
                                    <input type="text" name="name"  placeholder="{{ $langg->lang182 }}" required/>
                                </p>								
                                <p>
                                    <label>Email address <span>*</span></label>
                                    <input type="email" name="email" placeholder="{{ $langg->lang183 }}" required />
                                </p>
                                <p>
                                    <label>Password <span>*</span></label>
                                    <input type="password" name="password" placeholder="{{ $langg->lang186 }}" required
									pattern=".{6,}" onchange="this.setCustomValidity(this.validity.patternMismatch ? this.title : '');if(this.checkValidity()) form.password_confirmation.pattern = this.value;" 
									oninvalid="this.setCustomValidity('Password must contain at least 6 characters')"/>
                                </p>
                                <p>
                                    <label>Confirm Password <span>*</span></label>
                                    <input type="password" name="password_confirmation" placeholder="{{ $langg->lang186 }}" required
									pattern=".{6,}" onchange="this.setCustomValidity(this.validity.patternMismatch ? this.title : '');" 
									oninvalid="this.setCustomValidity('Confirm password does not match the password')"/>
                                </p>
								<input class="mprocessdata" type="hidden" value="{{ $langg->lang188 }}">
                                <div class="login_submit">
                                    <button type="submit" class="submit-btn">Register</button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!--register area end-->
                </div>
            </div>
        </div>
        <!-- customer login end -->

@endsection