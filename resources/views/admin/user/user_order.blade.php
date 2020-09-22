@extends('layouts.adminLayout.admin_design')
@section('content')
<div id="content">
  <div id="coxntent-header">
  <div id="breadcrumb"> <a href="index.html" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a> <a href="#">orders</a> <a href="#" class="current">Validation</a> </div>
    <h1>View Order</h1>
    
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
  </div>
  <div class="container-fluid">
    <hr>
    <div class="row-fluid">
      <div class="span12">

        <div class="widget-box">
          <div class="widget-title"> <span class="icon"><i class="icon-th"></i></span>
            <h5>View Order</h5>
          </div>
          <div class="widget-content nopadding">
            <table class="table table-bordered data-table">
              <thead>
                <tr>
                  <th>Order ID</th>
                  <th>Order Date</th>
                  <th>Customer Name</th>
                  <th>Customer Email </th>
                  <th>Order Products</th>
                  <th>Order amount</th>
                  <th>Order Status</th>
                  <th>Payment Method</th>
                
                  
                 
                  
                  <th>Action</th>
                </tr>
              </thead>
              <tbody>
                  @foreach($orderDetails as $order)
                <tr class="gradeX">
                  <td>{{$order->id}}</td>
                  <td>{{$order->created_at}}</td>
                  <td>{{$order->name}}</td>
                  <td>{{$order->user_email}}</td>
                  
               
                  <td>
                  @foreach($order->orders as $pro)
                  {{$pro->product_name}}
                  @endforeach
                  </td>
                 
                  

                  <td> $ {{$order->grand_total}}</td>
                
                <td>{{$order->order_status}}</td>
                <td>{{$order->payment_method}}</td>

              
                  <td class="center"> <a  href="{{url('/admin/view-order/'.$order->id)}}" class="btn btn-success btn-mini">View Details</a></td> 
                </tr>
                @endforeach
                
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
@endsection