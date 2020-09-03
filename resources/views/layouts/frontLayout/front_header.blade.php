<?php
use App\Http\Controllers\Controller;
$mainCategories = Controller::mainCategories();

?>


<header id="header"><!--header-->
		<div class="header_top " ><!--header_top-->
			<div class="container-fluid" >
				<div class="row " >
					<div class="col-sm-6 " >
						<div class="contactinfo " style="margin-left:30px;">
							<ul class="nav nav-pills "  >
								<li ><a href="#"><i class="fa fa-phone"></i> +977 9851018264</a></li>
								<li > <a href="#"><i class="fa fa-envelope"></i> info@lordbhuddahimalayan.com</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="social-icons pull-right">
							<ul class="nav navbar-nav" style="padding-right:20px;">
								<li><a href="#"><i class="fa fa-facebook"></i></a></li>
								<li><a href="#"><i class="fa fa-twitter"></i></a></li>
								<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
								<li><a href="#"><i class="fa fa-dribbble"></i></a></li>
								<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
							</ul>
						</div>
					</div> 
				</div>
				
				<div class="row">

				<div class="col-3">
				<div class="logo pull-left animate__animated animate__bounce animate__delay-0.2s"  style="margin-left:30px;">
				<
							<!-- <a href="#"><img src="img/frontend_images/home/storelogo.png" width="60px"alt="" /></a> -->
							<h2 style="color:#CB4154;" ><span id="family" style="color:red;">LORD</span> BHUDDHA <span style="color:indigo;">HIMALAYAN</span> 	</h2>
						</div>

						
				</div>

				<div class="col-9">
				<div class="shop-menu pull-right" style="margin-right:50px;">
							<ul class="nav navbar-nav">
								<li style="margin-right:150px;">
									<div class="search_box pull-right">
							<input type="text" placeholder="Search"/>
							</div>
								</li>
									<!-- <li><a href="#"><i class="fa fa-star"></i> Wishlist</a></li> -->
								<li><a href="{{url('/orders')}}"><i class="fa fa-crosshairs"></i> Orders</a></li>
								<li><a href="{{url('/cart')}}"><i class="fa fa-shopping-cart"></i> Cart</a></li>
								@if(empty(Auth::check()))
								<li><a href="{{url('/login-register')}}"><i class="fa fa-lock"></i> Login</a></li>
								@else
								<li><a href="{{url('/account')}}"><i class="fa fa-user"></i> Account</a></li>
								<li><a href="{{url('/user-logout')}}"><i class="fa fa-sign-out"></i> Logout</a></li>
								@endif
							</ul>
						</div>

				</div>
					
					
				</div>
			</div>
		</div><!--/header_top-->
		
	
	
		<div class="header-bottom"><!--header-bottom-->
			<div class="container">
				<div class="row">
					<div class="col-sm-9">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
								<span class="sr-only">Toggle navigation</span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							</button>
						</div>
						<div class="mainmenu pull-left">
							<ul class="nav navbar-nav collapse navbar-collapse">
								<li><a href="{{asset('/')}}" class="active">Home</a></li>
								<li class="dropdown"><a href="#">Shop<i class="fa fa-angle-down"></i></a>
                                    <ul role="menu" class="sub-menu">
									@foreach($mainCategories as $cat)
                                        <li><a href="{{asset('/products/'.$cat->url)}}">{{$cat->name}}</a></li>
										@endforeach
                                    </ul>
                                </li> 
								<li ><a href="{{asset('/wholesale-login')}}">Wholesale</a>
                                   
                                </li> 
								
								<li><a href="contact-us.html">Contact</a></li>
							</ul>
							
						</div>
						
					</div>
					<div class="col-sm-3">
						
						
							
							<div class="btn-group">
								<button type="button" class="btn btn-default dropdown-toggle usa" data-toggle="dropdown">
									US DOLLAR
									<span class="caret"></span>
								</button>
								<ul class="dropdown-menu">
									<li><a href="#">Canadian Dollar</a></li>
									
									<li><a href="#">AUS Dollar</a></li>
									<li><a href="#">Pound</a></li>
									<li><a href="#">Euro</a></li>
								</ul>
							</div>
					</div>
				</div>
			</div>
		</div><!--/header-bottom-->
	</header><!--/header-->