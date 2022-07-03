@extends('layouts.vishruthi')

@section('content')
        <!--breadcrumbs area start-->
        <div class="breadcrumbs_area other_bread">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="breadcrumb_content">
                            <ul>
                                <li><a href="{{ route('front.index') }}">Home</a></li>
                                <li>/</li>
                                <li>contact us</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--breadcrumbs area end-->

        <!--contact area start-->
        <div class="contact_area">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-12">
                        <div class="contact_message content">
                            <h3>Contact us</h3>
                            <p>
                                {!! $ps->contact_text !!}
                            </p>
                            <ul>
                                <li><i class="fa fa-fax"></i> Address : {!! $ps->street !!}</li>
                                <li><i class="fa fa-phone"></i> <a href="#">{{$ps->phone}}</a></li>
                                <li><i class="fa fa-envelope-o"></i><a href="#">{{$ps->email}}</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-12">
                        <div class="contact_message form">
                            <h3>For Enquiry</h3>
                            <div class="gocover" style="background: url({{ asset('assets/images/'.$gs->loader) }}) no-repeat scroll center center rgba(45, 45, 45, 0.5);"></div>
							<form id="contactform" method="POST" action="{{route('front.contact.submit')}}">
                                {{csrf_field()}}
								@include('includes.admin.form-both')
								<input type="hidden" name="to" value="{{ $ps->contact_email }}">
								<p>
                                    <label> Your Name (required)</label>
                                    <input name="name" placeholder="Name *" type="text" />
                                </p>
                                <p>
                                    <label> Your Email (required)</label>
                                    <input name="email" placeholder="Email *" type="email" />
                                </p>
                                <p>
                                    <label> Subject</label>
                                    <input name="subject" placeholder="Subject *" type="text" />
                                </p>
                                <div class="contact_textarea">
                                    <label> Your Message</label>
                                    <textarea placeholder="Message *" name="text" class="form-control2"></textarea>
                                </div>
                                <button type="submit" class="submit-btn">Send</button>
                                <p class="form-messege"></p>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--contact area end-->

        <!--contact map start-->
        <div class="contact_map">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="map-area">
                            <!--   <iframe id="googleMap"  style="border: none;" src="https://maps.google.com/maps?q=121%20King%20St%2C%20Melbourne%20VIC%203000%2C%20Australia&amp;t=&amp;z=13&amp;ie=UTF8&amp;iwloc=&amp;output=embed"></iframe> -->

                            <iframe
                                id="googleMap"
                                style="border: none;"
                                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3916.3852186554004!2d76.94442941411828!3d11.009697057856744!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3ba8591c310a6fa3%3A0x22bc6690b9f6a8b1!2sVishruthi%20Jewel%20Palace!5e0!3m2!1sen!2sin!4v1633409517794!5m2!1sen!2sin"
                            ></iframe>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--contact map end-->
@endsection