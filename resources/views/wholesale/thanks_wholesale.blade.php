@extends('layouts.wholesaleLayout.front_design')
@section('content')


<section id="cart_items">
		<div class="container">
			<div class="breadcrumbs">
				<ol class="breadcrumb">
				  <li><a href="#">Home</a></li>
				  <li class="active">Thanks </li>
				</ol>
			</div>
		
		</div>
	</section> <!--/#cart_items-->

	<section id="do_action">
		<div class="container">
			<div class="heading" align="center">
				<h3>YOUR CODE HAS BEEN PLACED</h3>
				<p>Your order no is {{Session::get('order_id')}} and total payble about is ${{Session::get('grand_total')}}</p>
			</div>
			
		</div>
	</section><!--/#do_action-->

@endsection

<?php

Session::forget('order_id');
Session::forget('grand_total');
?>