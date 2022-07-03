@extends('layouts.vishruthi')

@section('content')    
	<!--slider area start-->
    @if($ps->slider == 1)

	<div class="slider_area slider_style owl-carousel">
		@if(count($sliders))
		@foreach($sliders as $data)        
		<div class="single_slider" data-bgimg="{{asset('assets/images/sliders/'.$data->photo)}}">
            <div class="container-fluid">
                <div class="row align-items-center">
                    <div class="col-12">
                        <div class="slider_content content_one">
                            <!-- <img src="{{asset('assets/front/vishruthi/img/slider/content.png')}}" alt=""> -->
                            <p>{{$data->details_text}}</p>
                            <a href="{{$data->link}}">Discover Now</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
		@endforeach
		@endif
    </div>
	@endif
    <!--slider area end-->
	<section id="extraData">
	
	</section>
    <!--Instagram area start-->
    <section class="instagram_area">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="section_title">
                        <h2>Follow us On Instagram</h2>
                        <p>Stay connected with #vishruthijewelemporium</p>
                    </div>
                </div>
            </div>
            <div class="instagram_home_block">
                <div class="row">
                    <div class="instagram_wrapper instagram_column5 owl-carousel">
						<?php
						$feed = 8;
						$timestamp = mktime(date('H'), date('i'), 0, date('n'), date('j') - 1, date('Y'));
						$AccessToken = 'IGQVJWSlF0eHJXSUdPTk9aYzA3NWlSWGxBS1FXb2gtNTlJNHl5cjVhRDRhVU56RllRdlFJTFhteTFoclJBT19MbFRLZAzV3bHRJVzBmLWxzSXdsNy1neVkxamxFX3p0SGFGdWZAWRHdPNVNzRUNzOS1zdgZDZD';
						$instagram_user_id = '4992666810766440';
						$url = 'https://graph.instagram.com/'.$instagram_user_id.'/media?access_token=' . $AccessToken;
						$counter = 0;						
						$ch = curl_init();
						curl_setopt($ch, CURLOPT_URL, $url);
						curl_setopt($ch, CURLOPT_HEADER, false);
						curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
						curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
						curl_setopt($ch, CURLOPT_MAXREDIRS, 10);
						curl_setopt($ch, CURLOPT_USERAGENT, 'Instagram Gallery');
						$result = curl_exec($ch);
						$http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
						curl_close($ch);
						$result = json_decode($result);
						foreach ($result->data as $media_id){
							$id = $media_id->id;
							$counter++;
							if( $counter <= $feed ){
								if( $id ) {
									$url = 'https://graph.instagram.com/'.$id.'?fields=id,media_type,media_url,username,timestamp,permalink&access_token=' . $AccessToken;
									$ch = curl_init();
									curl_setopt($ch, CURLOPT_URL, $url);
									curl_setopt($ch, CURLOPT_HEADER, false);
									curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
									curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
									curl_setopt($ch, CURLOPT_MAXREDIRS, 10);
									curl_setopt($ch, CURLOPT_USERAGENT, 'Instagram Gallery');
									$result_image = curl_exec($ch);
									curl_close($ch);
									$result_image = json_decode($result_image); ?>
									<div class="col-lg-3">
										<div class="single_instagram">
											<a href="javascript:;"><img src="<?php echo $result_image->media_url; ?>" alt=""></a>
											<div class="instagram_icone">
												<a class="instagram_pupop" href="<?php echo $result_image->media_url; ?>"><i class="fa fa-instagram"></i></a>
											</div>
										</div>
									</div>
									<?php
								}
							}
						}	?>
						<!--<div class="col-lg-3">
                            <div class="single_instagram">
                                <a href="#"><img src="{{asset('assets/front/vishruthi/img/about/intagram.png')}}" alt=""></a>
                                <div class="instagram_icone">
                                    <a class="instagram_pupop" href="{{asset('assets/front/vishruthi/img/about/intagram.png')}}"><i class="fa fa-instagram"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="single_instagram">
                                <a href="#"><img src="{{asset('assets/front/vishruthi/img/about/intagram1.png')}}" alt=""></a>
                                <div class="instagram_icone">
                                    <a class="instagram_pupop" href="{{asset('assets/front/vishruthi/img/about/intagram1.png')}}"><i class="fa fa-instagram"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="single_instagram">
                                <a href="#"><img src="{{asset('assets/front/vishruthi/img/about/intagram2.png')}}" alt=""></a>
                                <div class="instagram_icone">
                                    <a class="instagram_pupop" href="{{asset('assets/front/vishruthi/img/about/intagram2.png')}}"><i class="fa fa-instagram"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="single_instagram">
                                <a href="#"><img src="{{asset('assets/front/vishruthi/img/about/intagram3(1).png')}}" alt=""></a>
                                <div class="instagram_icone">
                                    <a class="instagram_pupop" href="{{asset('assets/front/vishruthi/img/about/intagram3(1).png')}}"><i class="fa fa-instagram"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="single_instagram">
                                <a href="#"><img src="{{asset('assets/front/vishruthi/img/about/intagram4(1).png')}}" alt=""></a>
                                <div class="instagram_icone">
                                    <a class="instagram_pupop" href="{{asset('assets/front/vishruthi/img/about/intagram4(1).png')}}"><i class="fa fa-instagram"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="single_instagram">
                                <a href="#"><img src="{{asset('assets/front/vishruthi/img/about/intagram1.png')}}" alt=""></a>
                                <div class="instagram_icone">
                                    <a class="instagram_pupop" href="{{asset('assets/front/vishruthi/img/about/intagram1.png')}}"><i class="fa fa-instagram"></i></a>
                                </div>
                            </div>
                        </div> -->
                    </div>
                    <div class="col-12">
                        <div class="text_follow">
                            <a href="{{ $socialsetting->linkedin }}" target="_blank">#Follow us on Instagram</a>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--Instagram area end-->	
@endsection
@section('scripts')
	<script>
        $(window).on('load',function() {

            setTimeout(function(){

                $('#extraData').load('{{route('front.extraIndex')}}');

            }, 500);
        });

	</script>
@endsection