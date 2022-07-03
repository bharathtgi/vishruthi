		@php 

		  if(isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on') 
		  {
			$link = "https"; 
		  }
		  else
		  {
			$link = "http"; 
			  
			// Here append the common URL characters. 
			$link .= "://"; 
			  
			// Append the host(domain name, ip) to the URL. 
			$link .= $_SERVER['HTTP_HOST']; 
			  
			// Append the requested resource location to the URL 
			$link .= $_SERVER['REQUEST_URI']; 
		  }      

		@endphp
<div class="col-sm-12 col-md-3 col-lg-3">
	<!-- Nav tabs -->
	<div class="dashboard_tab_button">
		<ul role="tablist" class="nav flex-column dashboard-list">
			<li><a href="{{ route('user-dashboard') }}" class="nav-link {{ $link == route('user-dashboard') ? 'active':'' }}">Dashboard</a></li>
			<li><a href="{{route('user-orders')}}" class="nav-link {{ $link == route('user-orders') ? 'active':'' }}">Orders</a></li>
			<li><a href="{{route('user-profile')}}" class="nav-link {{ $link == route('user-profile') ? 'active':'' }}">{{ $langg->lang205 }}</a></li>
			<li><a href="{{route('user-reset')}}" class="nav-link {{ $link == route('user-reset') ? 'active':'' }}">{{ $langg->lang206 }}</a></li>
			<li><a href="{{ route('user-logout') }}" class="nav-link">logout</a></li>
		</ul>
	</div>
</div>