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
                                <li>Profile</li>
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
                                <div class="tab-pane fade show active" id="account-details">
                                    <h3>Profile details</h3>
                                    <div class="login">
                                        <div class="login_form_container">
                                            <div class="account_login_form">
                                                @include('includes.admin.form-both')
												<form id="userform" action="{{route('user-profile-update')}}" method="POST" enctype="multipart/form-data">
                                                    {{ csrf_field() }}
													<label>Full Name*</label>
                                                    <input type="text"  name="name" placeholder="{{ $langg->lang264 }}" required=""  value="{{ $user->name }}" />
                                                    <label>Email*</label>
                                                    <input ame="email" type="email" placeholder="{{ $langg->lang265 }}" required="" value="{{ $user->email }}" disabled />
                                                    <label>Phone*</label>
                                                    <input name="phone" type="text" placeholder="{{ $langg->lang266 }}" required="" value="{{ $user->phone }}" />
                                                    <label>Fax</label>
                                                    <input name="fax" type="text" placeholder="{{ $langg->lang267 }}" value="{{ $user->fax }}" />
                                                    <label>City</label>
                                                    <input name="city" type="text" placeholder="{{ $langg->lang268 }}" value="{{ $user->city }}" />													
                                                    <label>Zip</label>
                                                    <input name="zip" type="text" placeholder="{{ $langg->lang269 }}" value="{{ $user->zip }}" />                                                    
													<label>Address*</label>
													<input name="address" required="" placeholder="{{ $langg->lang270 }}" value="{{ $user->address }}">
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