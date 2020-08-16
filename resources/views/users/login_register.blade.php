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
						<h2>Login to your account</h2>
						<form action="#">
							<input type="text" placeholder="Name" />
							<input type="email" placeholder="Email Address" />
							<span>
								<input type="checkbox" class="checkbox"> 
								Keep me signed in
							</span>
							<button type="submit" class="btn btn-default">Login</button>
						</form>
					</div><!--/login form-->
				</div>
				<div class="col-sm-1">
					<h2 class="or">OR</h2>
				</div>
				<div class="col-sm-4">
					<div class="signup-form"><!--sign up form-->
						<h2>New User Signup!</h2>
                        <form id="registerForm" name="registerForm" action="{{url('/login-register')}}" method="post">
                        {{csrf_field()}}
							<input type="text" name="name" id="name" placeholder="Name"/>
							<input type="email" name="email" id="email" placeholder="Email Address"/>
							<input type="password" name="password" id="password" placeholder="Password"/>
							<button type="submit" class="btn btn-default">Signup</button>
						</form>
					</div><!--/sign up form-->
				</div>
			</div>
		</div>
    </section><!--/form-->
    
@endsection