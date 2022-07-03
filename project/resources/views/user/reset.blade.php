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
                                <li>Reset Password</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--breadcrumbs area end-->
        <section class="main_content_area">
            <div class="container">
                <div class="account_dashboard">
                    <div class="row">
						@include('includes.user-dashboard-sidebar')
                        <div class="col-sm-12 col-md-9 col-lg-9">
                            <!-- Tab panes -->
                            <div class="tab-content dashboard_content">
                                <div class="tab-pane fade show active" id="account-details">
                                    <h3>Reset Password</h3>
                                    <div class="login">
                                        <div class="login_form_container">
                                            <div class="account_login_form">
                                                @include('includes.admin.form-both')
												<form id="userform" action="{{route('user-reset-submit')}}" method="POST" enctype="multipart/form-data">
                                                    {{ csrf_field() }}
													
													<label>{{ $langg->lang273 }}*</label>
                                                    <input type="password"  name="cpass" required=""   />
                                                    <label>{{ $langg->lang274 }}*</label>
                                                    <input type="password" name="newpass"  required
													pattern=".{6,}" onchange="this.setCustomValidity(this.validity.patternMismatch ? this.title : '');if(this.checkValidity()) form.renewpass.pattern = this.value;" 
													oninvalid="this.setCustomValidity('Password must contain at least 6 characters')"  />
                                                    <label>Confirm Password*</label>
                                                    <input type="password" name="renewpass"  required
													pattern=".{6,}" onchange="this.setCustomValidity(this.validity.patternMismatch ? this.title : '');" 
													oninvalid="this.setCustomValidity('Confirm password does not match the password')"  />
                                                    <div class="save_button primary_btn default_button account_form">
                                                        <button type="submit" class="submit-btn">Save</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
@endsection