@extends('layouts.wholesaleLayout.front_design')
@section('content')
<section id="form" style="margin-top:30px; margin-bottom:50px;"> <!--form-->

<div class="container">
<div class="breadcrumbs">
				<ol class="breadcrumb">
				  <li><a href="#">Home</a></li>
				  <li class="active">Order Review</li>
				</ol>
			</div>
			<div class="row">
				<div class="col-sm-4 col-sm-offset-1">
					<div class="login-form"><!--login form-->
						<h2>Billing Address</h2>
                            <div class="form-group"> 
                           {{$userDetails->name}} 
                            </div>
                            <div class="form-group"> 
                            {{$userDetails->address}} 
                            </div>

                            <div class="form-group"> 
                           {{$userDetails->city}} 
                            </div>
                            <div class="form-group"> 
                         {{$userDetails->state}} 
                            </div>
                            <div class="form-group"> 
                           
                        
                            {{$userDetails->country}} 
							
						
                            </div>
                            <div class="form-group"> 
                            {{$userDetails->pincode}} 
                            </div>
                            <div class="form-group"> 
                            {{$userDetails->mobile}} 
                            
</div>
<div class="form-group"> 
                            {{$userDetails->vat}} 
                            </div>

							
					
					</div><!--/login form-->
				</div>
				<div class="col-sm-1">
					<h2 ></h2>
				</div>
				<div class="col-sm-4">
					<div class="signup-form"><!--sign up form-->
						<h2>Shipping Address</h2>
					
                        <div class="form-group"> 
                           {{$shippingDetails->name}}
                            </div>
                            <div class="form-group"> 
                            {{$shippingDetails->address}}
                            </div>

                            <div class="form-group"> 
                            {{$shippingDetails->city}}
                            </div>
                            <div class="form-group"> 
                            {{$shippingDetails->state}}
                            </div>
                            <div class="form-group"> 
                            {{$shippingDetails->country}}
                            </div>
                            <div class="form-group"> 
                            {{$shippingDetails->pincode}}
                            </div>
                            <div class="form-group"> 
							{{$shippingDetails->mobile}}
</div>
<div class="form-group"> 
							{{$shippingDetails->vat}}
</div>
							
					
					</div><!--/sign up form-->
				</div>
            </div>

		</div>
    </section><!--/form-->


    <section id="cart_items" style="margin-top:20px;">
		<div class="container">
		

		

			<div class="shopper-informations">
				<div class="row">
								
				</div>
			</div>
			<div class="review-payment">
				<h2>Review & Payment</h2>
			</div>

			<div class="table-responsive cart_info">
				<table class="table table-condensed">
					<thead>
						<tr class="cart_menu">
							<td class="image">Item</td>
							<td class="description"></td>
							<td class="price">Price</td>
							<td class="quantity">Quantity</td>
							<td class="total">Total</td>
							<td></td>
						</tr>
					</thead>
					<tbody>
               <?php  $total_amount=0; ?>
                  @foreach($userCart as $cart)
						<tr>
							<td class="cart_product">
								<a href=""><img style="width:100px;" src="{{asset( 'img/backend_images/products/small/'.$cart->image) }}"></a>
							</td>
							<td class="cart_description">
                     <h4><a href="">{{$cart->product_name}}</a></h4>
                                <p>Code: {{$cart->product_code}}</p>
                                <p>Size: {{$cart->size}}</p>
							</td>
							<td class="cart_price">
							<p>Rs {{$cart->price}}</p>
							</td>
							<td class="cart_quantity">
								<div class="cart_quantity_button">
									{{$cart->quantity}}
								</div>
							</td>
							<td class="cart_total">
								<p class="cart_total_price">Rs {{$cart->price*$cart->quantity}}</p>
							</td>
							
						</tr>
						<?php $total_amount = $total_amount + ($cart->price*$cart->quantity); ?>
                  @endforeach


						<tr>
							<td colspan="4">&nbsp;</td>
							<td colspan="2">
								<table class="table table-condensed total-result">
									<tr>
										<td>Cart Sub Total</td>
										<td>RS {{$total_amount}}</td>
									</tr>
								
									<tr class="shipping-cost">
										<td>Shipping Cost</td>
										<td> $ 10</td>										
									</tr>
									<tr class="shipping-cost">
										<td>Discount Amount</td>
										<td> 
										@if(!empty(Session::get('CouponAmount')))
										RS {{ Session::get('CouponAmount') }}
										@else
										0
										@endif
										</td>										
									</tr>
									<tr>
										<td>Grand Total</td>
										<td><span>RS {{ $grand_total= $total_amount-Session::get('CouponAmount')+10}} </span></td>
									</tr>
								</table>
							</td>
						</tr>
					</tbody>
				</table>
			</div>

			<form action="{{url('/place-order-wholesale')}}" method="post" name="paymentForm" id="paymentForm"  >{{csrf_field()}}

			<div class="payment-options">
				<input type="hidden" id="" name="grand_total" value="{{$grand_total}}">
					<span>
						<label> <strong>Select Payment Method:</strong></label>
					</span>
					<span>
						<label><input type="radio" name="payment_method" id="COD" value="COD"> COD</label>
					</span>
					<span>
						<label><input type="radio" name="payment_method" id="paypal" value="paypal"> Paypal</label>
					</span>

					<span style="float:right;">
					<button type="submit" class="btn btn-primary"  onclick ="return selectPaymentMethod();" >Place Order</button>
					</span>
					
				</div>
				</form>
		</div>
	</section> <!--/#cart_items-->

@endsection