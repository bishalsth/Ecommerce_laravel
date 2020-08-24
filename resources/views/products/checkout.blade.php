@extends('layouts.frontLayout.front_design')
@section('content')


<section id="form"><!--form-->

		<div class="container">
                <div class="breadcrumbs">
				<ol class="breadcrumb">
				  <li><a href="#">Home</a></li>
				  <li class="active">Check Out</li>
				</ol>
			</div>
        @if(Session::has('flash_message_error'))
        <div class="alert alert-error alert-block">
	<button type="button" class="close" data-dismiss="alert">×</button>	
        <strong>{{ session('flash_message_error') }}</strong>
</div>
        @endif  
        @if(Session::has('flash_message_success'))
        <div class="alert alert-success alert-block">
	<button type="button" class="close" data-dismiss="alert">×</button>	
        <strong>{{ session('flash_message_success') }}</strong>
</div>
        @endif
        <form action="{{url('/checkout')}}" method="post" >{{csrf_field()}}
			<div class="row">
				<div class="col-sm-4 col-sm-offset-1">
					<div class="login-form"><!--login form-->
						<h2>Bill To</h2>
                            <div class="form-group"> 
                            <input type="text" name="billing_name" id="billing_name"  value={{$userDetails->name}} placeholder="Billing Name" class="form-control"/>
                            </div>
                            <div class="form-group"> 
                            <input type="text" name="billing_address" id="billing_address" value={{$userDetails->address}} placeholder="Billing Address" class="form-control"/>
                            </div>

                            <div class="form-group"> 
                            <input type="text" name="billing_city" id="billing_city" value={{$userDetails->city}} placeholder="Billing City" class="form-control"/>
                            </div>
                            <div class="form-group"> 
                            <input type="text" name="billing_state" id="billing_state" value={{$userDetails->state}} placeholder="Billing State" class="form-control"/>
                            </div>
                            <div class="form-group"> 
                           
                            <select name="billing_country" id="billing_country">Select Country
							<option>Select Country</option>
							@foreach($countries as $country)
							<option value="{{$country->name}}"@if($country->name == $userDetails->country)selected @endif>{{$country->name}}</option>
							@endforeach
						</select>
                            </div>
                            <div class="form-group"> 
                            <input type="text" name="billing_pincode" id="billing_pincode" value={{$userDetails->pincode}} placeholder="Billing Pincode" class="form-control"/>
                            </div>
                            <div class="form-group"> 
                            <input type="text" name="billing_mobile" id="billing_mobile" value={{$userDetails->mobile}} placeholder="Billing Mobile" class="form-control"/>
                            
</div>

<div class="form-check">
    <input type="checkbox" class="form-check-input" id="exampleCheck1">
    <label class="form-check-label" for="exampleCheck1">Shipping Address same as Billing Address</label>
  </div>
							
					
					</div><!--/login form-->
				</div>
				<div class="col-sm-1">
					<h2 ></h2>
				</div>
				<div class="col-sm-4">
					<div class="signup-form"><!--sign up form-->
						<h2>Ship To</h2>
					
                        <div class="form-group"> 
                            <input  type="text"  name="shipping_name" value="{{$shippingDetails->name}}" id="shipping_name" placeholder="Shipping Name" class="form-control"/>
                            </div>
                            <div class="form-group"> 
                            <input type="text" name="shipping_address" value="{{$shippingDetails->address}}" id="shipping_address" placeholder="Shipping Address" class="form-control"/>
                            </div>

                            <div class="form-group"> 
                            <input type="text" name="shipping_city" value="{{$shippingDetails->city}}" id="shipping_city" placeholder="Shipping City" class="form-control"/>
                            </div>
                            <div class="form-group"> 
                            <input type="text" name="shipping_state" value="{{$shippingDetails->state}}" id="shipping_state" placeholder="Shipping State" class="form-control"/>
                            </div>
                            <div class="form-group"> 
                            <input type="text" name="shipping_country" value="{{$shippingDetails->country}}" id="shipping_country" placeholder="Shipping Country" class="form-control"/>
                            </div>
                            <div class="form-group"> 
                            <input type="text" name="shipping_pincode" value="{{$shippingDetails->pincode}}" id="shipping_pincode" placeholder="Shipping Pincode" class="form-control"/>
                            </div>
                            <div class="form-group"> 
							<input type="text" name="shipping_mobile" value="{{$shippingDetails->mobile}}" id="shipping_mobile" placeholder="Shipping Mobile" class="form-control"/>
</div>
							<button type="submit" class="btn btn-default">Checkout</button>
					
					</div><!--/sign up form-->
				</div>
            </div>
</form>
		</div>
    </section><!--/form-->


    
    

    @endsection