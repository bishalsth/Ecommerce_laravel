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
						<form action="" method="post" id="LoginForm" name="LoginForm">
						{{csrf_field()}}
						
						</form>
					</div><!--/login form-->
				</div>
				<div class="col-sm-1">
					<h2 class="or">OR</h2>
				</div>
				<div class="col-sm-4">
					<div class="signup-form"><!--sign up form-->
						<h2>New User Update!</h2>
                        <form id="registerForm" name="registerForm" action="" method="post">
                        {{csrf_field()}}
							
						</form>
					</div><!--/sign up form-->
				</div>
			</div>
		</div>
    </section><!--/form-->
    
@endsection