@extends('layouts.frontLayout.front_design')
@section('content')

<section id="form"><!--form-->
		<div class="container">
			<div class="row">
            @if(Session::has('flash_message_error'))
        <div class="alert alert-danger alert-block">
	<button type="button" class="close" data-dismiss="alert">×</button>	
        <strong>{{ session('flash_message_error') }}</strong>
</div>
        @endif  
        @if(Session::has('flash_message_success'))
        <div class="alert alert-success alert-block" style="background-color: red;">
	<button type="button" class="close" data-dismiss="alert">×</button>	
        <strong>{{ session('flash_message_success') }}</strong>
</div>
        @endif
				<div class="col-sm-4 col-sm-offset-1">
					<div class="login-form"><!--login form-->
						<h2>Update account</h2>
						<form action="{{url('/account')}}" method="post" id="AccountForm" name="AccountForm">
						{{csrf_field()}}
						<input type="name" id="name" value="{{$userdetails->name}}" name="name" placeholder="name" />
						<input type="address" id="address" value="{{$userdetails->address}}" name="address" placeholder="address" />
						<input type="city" id="city" value="{{$userdetails->city}}" name="city" placeholder="city" />
						<input type="state" id="state" value="{{$userdetails->state}}" name="state" placeholder="state" />
					
						<select name="country" id="country">Select Country
							<option>Select Country</option>
							@foreach($countries as $country)
							<option value="{{$country->name}}"@if($country->name == $userdetails->country)selected @endif>{{$country->name}}</option>
							@endforeach
						</select>
						<input style="margin-top:10px;" type="pincode" id="pincode" value="{{$userdetails->pincode}}" name="pincode" placeholder="pincode" />
						<input type="mobile" id="mobile" name="mobile" value="{{$userdetails->mobile}}" placeholder="mobile" />
						<button type="submit" class="btn btn-default">Update</button>
					


						</form>
					</div><!--/login form-->
				</div>
				<div class="col-sm-1">
					<h2 class="or">OR</h2>
				</div>
				<div class="col-sm-4">
					<div class="signup-form"><!--sign up form-->
						<h2> Update Password</h2>
                        <form id="passwordForm" name="passwordForm" action="{{url('/update-user-pwd')}}" method="post">
                        {{csrf_field()}}
						<input type="password" id="current_pwd"  name="current_pwd" placeholder="Current Password" />
						<span id="chkPWD"></span>
						<input type="password" id="new_password"  name="new_password" placeholder="New Password" />
						<input type="password" id="confirm_password"  name="confirm_password" placeholder="Confirm Password" />	
						<button type="submit" class="btn btn-default">Update</button>
						</form>
					</div><!--/sign up form-->
				</div>
			</div>
		</div>
    </section><!--/form-->
    
@endsection