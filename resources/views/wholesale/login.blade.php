@extends('layouts.frontLayout.front_design')
@section('content')

<section id="form" style="margin-top:20px;" ><!--form-->
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
				
				
				<div class="col-sm-4">
					<div class="signup-form"><!--sign up form-->
						<b><h2>New User Signup!</h2></b>
                        <form id="registerForm" name="registerForm" action="{{url('/wholesale-register')}}" method="post">
                        {{csrf_field()}}
                        <input type="text" name="C_name" id="name" placeholder="Company Name"/>
                        <input type="text" name="pincode" id="name" placeholder="PIN Code"/>
                        <input type="text" name="address" id="name" placeholder="Address"/>
                        <input type="text" name="country" id="name" placeholder="Country"/>
                        <input type="text" name="city" id="name" placeholder="City"/>
                        <input type="text" name="state" id="state" placeholder="State"/>

                        <input type="text" name="zip" id="zip" placeholder="Zip"/>
                        <input type="text" name="phone" id="phone" placeholder="Phone"/>
                        <input type="text" name="vat" id="vat" placeholder="Vat   "/>

                        
							<input type="text" name="name" id="name" placeholder="Name"/>
							<input type="email" name="email" id="email" placeholder="Email Address"/>
							<input type="password" name="password" id="myPassword" placeholder="Password"/>

                           
                <label class="control-label">Enable</label>
                
                  <input type="checkbox" name="status" id="status" value="1">
             
                            
							<button type="submit" class="btn btn-default">Signup</button>
						</form>
					</div><!--/sign up form-->
				</div>

                <div class="col-sm-1">
					<h2 class="or">OR</h2>
				</div>

                <div class="col-sm-4 col-sm-offset-1">
					<div class="login-form"><!--login form-->
						<h2>Login to your account</h2>
						<form action="{{url('/wholesale-signin')}}" method="post" id="LoginForm" name="LoginForm">
						{{csrf_field()}}
							<input type="email" id="email" name="email" placeholder="Email" />
							<input type="password" id="password" name="password" placeholder=" Password" />
							
							<button type="submit" class="btn btn-default">Login</button>
						</form>
					</div><!--/login form-->
				</div>
			</div>
		</div>
    </section><!--/form-->
    
@endsection