@extends('layouts.vishruthi')

@section('styles')
<link rel="stylesheet" href="{{asset('assets/front/vishruthi/css/accordion.css')}}" />
@endsection

@section('content')
        <!--breadcrumbs area start-->
        <div class="breadcrumbs_area other_bread">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="breadcrumb_content">
                            <ul>
                                <li><a href="{{route('front.index')}}">home</a></li>
                                <li>/</li>
                                <li>Frequently Questions</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--breadcrumbs area end-->

        <!--faq area start-->
        <div class="faq_content_area">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="faq_content_wrapper">
                            <h4>Below are frequently asked questions, you may find the answer for yourself</h4>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--Accordion area-->
        <div class="faq">
            <div class="container">
                <div class="accordion"><?php $i=0; ?>
                    @foreach($faqs as $fq) 
					<div class="accordion-item">
                        <button id="accordion-button" aria-expanded="<?php if ($i == 0) { echo "true"; } else { echo "false"; } ?>">
                            <span class="accordion-title">{{ $fq->title }}</span>
                            <span class="icon" aria-hidden="true"></span>
                        </button>
                        <div class="accordion-content">
                            <p>
                                {!! $fq->details !!}.
                            </p>
                        </div>
                    </div><?php $i++; ?>
					@endforeach
                </div>
            </div>
        </div>
        <!--Accordion area end-->
@endsection

@section('scripts')
<script src="{{asset('assets/front/vishruthi/js/accordion.js')}}"></script>
@endsection