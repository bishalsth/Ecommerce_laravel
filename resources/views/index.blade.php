@extends('layouts.frontLayout.front_design')
@section('content')
<section id="slider"><!--slider-->
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-12">
					<div id="slider-carousel" class="carousel slide" data-ride="carousel">
						<ol class="carousel-indicators">
						@foreach($banners as $key => $banner)
							<li data-target="#slider-carousel" data-slide-to="0" class="active"></li>
							@endforeach
						</ol>
						
						<div class="carousel-inner">
						@foreach($banners as $key => $banner)
							<div class="item @if($key==0) active @endif">
							<a href="{{$banner->link}}"> <img src="img/frontend_images/banners/{{$banner->image}}" width="100%" height="300px" alt=""></a>
							</div>
							@endforeach
							
						</div>
						
						<a href="#slider-carousel" class="left control-carousel hidden-xs" data-slide="prev">
							<i class="fa fa-angle-left"></i>
						</a>
						<a href="#slider-carousel" class="right control-carousel hidden-xs" data-slide="next">
							<i class="fa fa-angle-right"></i>
						</a>
					</div>
					
				</div>
			</div>
		</div>
	</section><!--/slider-->
	
	<section>
		<div class="container-fluid" style="padding-right:200px;">
 			<div class="row">
			 <style>
body, html {
  height: 100%;
  margin: 0;
}

.bg {
  /* The image used */
  background-image: url("img/back.jpg");

  /* Full height */
  height: 100%; 

  /* Center and scale the image nicely */
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
}
</style>
<div class="bg"></div>
				<div class="col-sm-3">
					@include('layouts.frontLayout.front_sidebar')
				</div>
				
				<div class="col-sm-9 padding-right">
					<div class="features_items"><!--features_items-->
                        <h2 class="title text-center">Features Items</h2>
                        @foreach($productsAll as $product)
						<div class="col-sm-3" >
							<div class="product-image-wrapper">
								<div class="single-products">
										<div class="productinfo text-center">
											<img src="{{asset( 'img/backend_images/products/small/'.$product->image) }}" alt="" />
											<h2>$ {{$product->price}}</h2>
											<p>{{$product->description}}</p>
											<a href="{{url('/product/'.$product->id)}}" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
										</div>
										<!-- <div class="product-overlay">
											<div class="overlay-content">
												<h2>$56</h2>
												<p>Easy Polo Black Edition</p>
												<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
											</div>
										</div> -->
								</div>
								<div class="choose">
									<ul class="nav nav-pills nav-justified">
										<li><a href="#"><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
										<li><a href="#"><i class="fa fa-plus-square"></i>Add to compare</a></li>
									</ul>
								</div>
							</div>
                        </div>
                        @endforeach
					
						
					</div><!--features_items-->
					
					
					
				</div>
			</div>
		</div>
	</section>
	<style>
        .whatsapp{
            position: fixed;
            left: 95%;
            top:80%;
        }
        .viber{
            position: fixed;
            left: 95%;
            top:72%;
        }
    </style>


	<a class="whatsapp" href="https://wa.me/9813245782/"> 
        <img src="https://icons-for-free.com/iconfiles/png/512/chat+friends+message+social+whatsapp+icon-1320194692736560212.png" alt="Contact in Whatsapp" width="100px" height="100px">
        </a>
​
        <!-- Client Number -->
        <a class="viber" href="viber://chat/?number=%+9779813245782">
        <img src="https://cdn2.iconfinder.com/data/icons/social-icons-33/128/Viber-512.png" alt="Contact in Viber" width="80px" height="80px">
        </a>
@endsection