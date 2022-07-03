@extends('layouts.vishruthi')
@section('styles')
	<style>
		.page-item {
			margin-right: 5px;
		}
	</style>
@endsection
@section('content')

        <!--breadcrumbs area start-->
        <div class="breadcrumbs_area">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="breadcrumb_content">
                            <ul>
                                <li><a href="{{ route('front.index') }}">home</a></li>
                                <li>/</li>
                                <li>shop</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--breadcrumbs area end-->

        <!--shop  area start-->
        <div class="shop_area shop_reverse">
            <div class="container">
                <div class="shop_inner_area">
                    <div class="row">
                        <div class="col-lg-3 col-md-12">
                            <!--sidebar widget start-->
                            <div class="sidebar_widget">
                                <div class="widget_list widget_filter">
                                    <h2>Filter by price</h2>
                                    <form id="price_filter">
                                        <div id="slider-range" class="price-filter-range" name="rangeInput"></div>
                                        <button type="submit" >Filter</button>
                                        <input type="text" name="text" id="amount" />
										<input type="hidden"   name="min"  id="min_price" class="price-range-field" />
										<input type="hidden"   name="max" id="max_price" class="price-range-field" />
                                    </form>
                                </div>
                                <div class="widget_list widget_categories">
                                    <h2>Product categories</h2>
                                    <ul>
										@foreach ($categories as $category)
                                        <li>
                                            <a href="{{route('front.category', $category->slug)}}{{!empty(request()->input('search')) ? '?search='.request()->input('search') : ''}}"><b>{{$category->name}}</b></a>
                                            @if(count($category->subs) > 0)
											<ul>
												@foreach($category->subs as $subcat)
                                                <li><input type="checkbox" class="filter-subcat" name="filter_subcat[]" value="{{$subcat->id}}" /> {{$subcat->name}}</li>
												@endforeach
                                            </ul>
											@endif
                                        </li>
										@endforeach
                                    </ul>
                                </div>
                                <div class="widget_list widget_categories">
                                    <h2>Antiq Product</h2>
                                    <ul>
                                        <li>
                                            <a href="javascript:;"><input type="checkbox" class="is_antic" name="is_antic" value="1" /> Antiq</a>
                                        </li>
                                    </ul>
                                </div>								
                                <div class="widget_list widget_categories">
                                    <h2>Chain Type</h2>
                                    <ul>
                                        <li>
                                            <a href="javascript:;"><input type="checkbox" class="filter-chaintype" name="filter_chaintype[]" value="Rope" /> Rope</a>
                                        </li>
                                        <li>
                                            <a href="javascript:;"><input type="checkbox" class="filter-chaintype" name="filter_chaintype[]" value="Back Chain" /> Back Chain </a>
                                        </li>
                                    </ul>
                                </div>

                                <div class="widget_list widget_categories">
                                    <h2>Bangles Size</h2>
                                    <ul>
                                        <li>
                                            <a href="javascript:;"><input type="checkbox" class="filter-banglesize" name="filter_banglesize[]" value="2.4" /> 2.4</a>
                                        </li>
                                        <li>
                                            <a href="javascript:;"><input type="checkbox" class="filter-banglesize" name="filter_banglesize[]" value="2.6" /> 2.6</a>
                                        </li>
                                        <li>
                                            <a href="javascript:;"><input type="checkbox"  class="filter-banglesize" name="filter_banglesize[]" value="2.8" /> 2.8</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <!--sidebar widget end-->
                        </div>
                        <div class="col-lg-9 col-md-12">
                            <!--shop wrapper start-->
                            <!--shop toolbar start-->
                            <div class="shop_title">
                                <h1>shop</h1>
                            </div>
                            <div class="shop_toolbar_wrapper">
                                <div class="shop_toolbar_btn">
                                    <button data-role="grid_3" type="button" class="active btn-grid-3" data-toggle="tooltip" title="3"></button>

                                    <button data-role="grid_4" type="button" class="btn-grid-4" data-toggle="tooltip" title="4"></button>

                                    <button data-role="grid_5" type="button" class="btn-grid-5" data-toggle="tooltip" title="5"></button>

                                    <button data-role="grid_list" type="button" class="btn-list" data-toggle="tooltip" title="List"></button>
                                </div>
                                <div class="niceselect_option">
                                    <form class="select_option" action="#">
                                        <select id="sortby" name="sort">
                                            <!--<option selected value="1">Sort by average rating</option>
                                            <option value="2">Sort by popularity</option>-->
                                            <option value="date_desc">Sort by newness</option>
                                            <option value="price_asc">Sort by price: low to high</option>
                                            <option value="price_desc">Sort by price: high to low</option>
                                            <!--<option value="6">Product Name: Z</option>-->
                                        </select>
                                    </form>
                                </div>
                                <!--<div class="page_amount">
                                    <p>Showing 1–9 of 21 results</p>
                                </div>-->
                            </div>
                            <!--shop toolbar end-->

                            <div class="row shop_wrapper categori-item-area" id="ajaxContent">
                                @include('includes.product.filtered-products')
							</div>
							<div id="ajaxLoader" class="ajax-loader" style="background: url({{asset('assets/images/'.$gs->loader)}}) no-repeat scroll center center rgba(0,0,0,.6);"></div>

                            <!--shop toolbar end-->
                            <!--shop wrapper end-->
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--shop  area end-->
@endsection
@section('scripts')

<script>

  $(document).ready(function() {
	
	$("#price_filter").submit(function(e){
		e.preventDefault();
		$("#ajaxLoader").show();
		filter();
	});
	$(".list li").on('click', function() { 
		//alert($(this).data('value'));
		//$("#sortby option[value='"+ $(this).data('value') +"']").prop("selected", true);
		$("#sortby").val($(this).data('value')).change();
	});
    // when dynamic attribute changes
    $(".attribute-input, #sortby").on('change', function() { 
      $("#ajaxLoader").show();
      filter();
    });
	$(".filter-subcat").on('change', function() {
		$("#ajaxLoader").show();
		filter();		
	});
	$(".is_antic").on('change', function() {
		$("#ajaxLoader").show();
		filter();		
	});	
	$(".filter-chaintype").on('change', function() {
		$("#ajaxLoader").show();
		filter();		
	});
	$(".filter-banglesize").on('change', function() {
		$("#ajaxLoader").show();
		filter();		
	});	
    // when price changed & clicked in search button
    $(".filter-btn").on('click', function(e) {
      e.preventDefault();
      $("#ajaxLoader").show();
      filter();
    });
  });

  function filter() {
    let filterlink = '';

/*     if ($("#prod_name").val() != '') {
      if (filterlink == '') {
        filterlink += '{{route('front.category', [Request::route('category'), Request::route('subcategory'), Request::route('childcategory')])}}' + '?search='+$("#prod_name").val();
      } else {
        filterlink += '&search='+$("#prod_name").val();
      }
    }

    $(".attribute-input").each(function() {
      if ($(this).is(':checked')) {
        if (filterlink == '') {
          filterlink += '{{route('front.category', [Request::route('category'), Request::route('subcategory'), Request::route('childcategory')])}}' + '?'+$(this).attr('name')+'='+$(this).val();
        } else {
          filterlink += '&'+$(this).attr('name')+'='+$(this).val();
        }
      }
    }); */

    if ($("#sortby").val() != '') {
      if (filterlink == '') {
        filterlink += '{{route('front.category', [])}}' + '?'+$("#sortby").attr('name')+'='+$("#sortby").val();
      } else {
        filterlink += '&'+$("#sortby").attr('name')+'='+$("#sortby").val();
      }
    }

     if ($("#min_price").val() != '') {
      if (filterlink == '') {
        filterlink += '{{route('front.category', [Request::route('category'), Request::route('subcategory'), Request::route('childcategory')])}}' + '?'+$("#min_price").attr('name')+'='+$("#min_price").val();
      } else {
        filterlink += '&'+$("#min_price").attr('name')+'='+$("#min_price").val();
      }
    }

    if ($("#max_price").val() != '') {
      if (filterlink == '') {
        filterlink += '{{route('front.category', [Request::route('category'), Request::route('subcategory'), Request::route('childcategory')])}}' + '?'+$("#max_price").attr('name')+'='+$("#max_price").val();
      } else {
        filterlink += '&'+$("#max_price").attr('name')+'='+$("#max_price").val();
      }
    } 
	
	if ( $('[name="filter_subcat[]"]:checked').length > 0){
		var checkedVals = $('.filter-subcat:checkbox:checked').map(function() { 
			return this.value;
		}).get();
		var filter_subcat = checkedVals.join(","); //alert(filter_subcat);
		if (filterlink == '') {
			filterlink += '{{route('front.category', [Request::route('category'), Request::route('subcategory'), Request::route('childcategory')])}}' + '?filter_subcat='+filter_subcat;
		} else {
			filterlink += '&filter_subcat='+filter_subcat;
		}		
	}	
	if ( $('[name="filter_chaintype[]"]:checked').length > 0){
		var checkedVals = $('.filter-chaintype:checkbox:checked').map(function() { 
			return this.value;
		}).get();
		var filter_chaintype = checkedVals.join(",");
		if (filterlink == '') {
			filterlink += '{{route('front.category', [Request::route('category'), Request::route('subcategory'), Request::route('childcategory')])}}' + '?filter_chaintype='+filter_chaintype;
		} else {
			filterlink += '&filter_chaintype='+filter_chaintype;
		}		
	}
	if($('[name="is_antic"]').is(':checked') ) {
		if (filterlink == '') {
			filterlink += '{{route('front.category', [Request::route('category'), Request::route('subcategory'), Request::route('childcategory')])}}' + '?is_antic=1';
		} else {
			filterlink += '&is_antic=1';
		}		
	}
	if ( $('[name="filter_banglesize[]"]:checked').length > 0){
		var checkedVals = $('.filter-banglesize:checkbox:checked').map(function() { 
			return this.value;
		}).get();
		var filter_banglesize = checkedVals.join(",");
		if (filterlink == '') {
			filterlink += '{{route('front.category', [Request::route('category'), Request::route('subcategory'), Request::route('childcategory')])}}' + '?filter_banglesize='+filter_banglesize;
		} else {
			filterlink += '&filter_banglesize='+filter_banglesize;
		}		
	}	

    // console.log(filterlink);
    console.log(encodeURI(filterlink));
    $("#ajaxContent").load(encodeURI(filterlink), function(data) {
      // add query string to pagination
      addToPagination();
      $("#ajaxLoader").fadeOut(1000);
    });
  }

  // append parameters to pagination links
  function addToPagination() {
    // add to attributes in pagination links
    $('ul.pagination li a').each(function() {
      let url = $(this).attr('href');
      let queryString = '?' + url.split('?')[1]; // "?page=1234...."

      let urlParams = new URLSearchParams(queryString);
      let page = urlParams.get('page'); // value of 'page' parameter

      let fullUrl = '{{route('front.category', [Request::route('category'),Request::route('subcategory'),Request::route('childcategory')])}}?page='+page+'&search='+'{{request()->input('search')}}';

      $(".attribute-input").each(function() {
        if ($(this).is(':checked')) {
          fullUrl += '&'+encodeURI($(this).attr('name'))+'='+encodeURI($(this).val());
        }
      });

      if ($("#sortby").val() != '') {
        fullUrl += '&sort='+encodeURI($("#sortby").val());
      }

      if ($("#min_price").val() != '') {
        fullUrl += '&min='+encodeURI($("#min_price").val());
      }

      if ($("#max_price").val() != '') {
        fullUrl += '&max='+encodeURI($("#max_price").val());
      }
		if ( $('[name="filter_subcat[]"]:checked').length > 0){
			var checkedVals = $('.filter-subcat:checkbox:checked').map(function() { 
				return this.value;
			}).get();
			var filter_subcat = checkedVals.join(",");
			fullUrl += '&filter_subcat='+filter_subcat;		
		}
		if($('[name="is_antic"]').is(':checked') ) {
			fullUrl += '&is_antic=1';
		}
		if ( $('[name="filter_chaintype[]"]:checked').length > 0){
			var checkedVals = $('.filter-chaintype:checkbox:checked').map(function() { 
				return this.value;
			}).get();
			var filter_chaintype = checkedVals.join(",");
			fullUrl += '&filter_chaintype='+filter_chaintype;		
		}	
		if ( $('[name="filter_banglesize[]"]:checked').length > 0){
			var checkedVals = $('.filter-banglesize:checkbox:checked').map(function() { 
				return this.value;
			}).get();
			var filter_banglesize = checkedVals.join(",");
			fullUrl += '&filter_banglesize='+filter_banglesize;		
		}	  

      $(this).attr('href', fullUrl);
    });
  }

  $(document).on('click', '.categori-item-area .pagination li a', function (event) {
    event.preventDefault();
    if ($(this).attr('href') != '#' && $(this).attr('href')) {
      $('#preloader').show();
      $('#ajaxContent').load($(this).attr('href'), function (response, status, xhr) {
        if (status == "success") {
          $('#preloader').fadeOut();
          $("html,body").animate({
            scrollTop: 0
          }, 1);

          addToPagination();
        }
      });
    }
  });

</script>

<script type="text/javascript">
	//alert($('#site_currency').find(":selected").text());
  $(function () {
	var currency_symbol = $('#site_currency').find(":selected").attr('rel');
    $("#slider-range").slider({
      range: true,
      orientation: "horizontal",
      min: 0,
      max: 100000,
      values: [{{ isset($_GET['min']) ? $_GET['min'] : '0' }}, {{ isset($_GET['max']) ? $_GET['max'] : '100000' }}],
      step: 5,

      slide: function (event, ui) {
        if (ui.values[0] == ui.values[1]) {
          return false;
        }

        $("#min_price").val(ui.values[0]);
        $("#max_price").val(ui.values[1]);
		$( "#amount" ).val( ""+currency_symbol + ui.values[ 0 ] + " - "+ currency_symbol + ui.values[ 1 ] );
      }
    });

    $("#min_price").val($("#slider-range").slider("values", 0));
    $("#max_price").val($("#slider-range").slider("values", 1));
    $( "#amount" ).val( ""+ currency_symbol + $( "#slider-range" ).slider( "values", 0 ) +
       " - "+ currency_symbol + $( "#slider-range" ).slider( "values", 1 ) );
  });

</script>



@endsection