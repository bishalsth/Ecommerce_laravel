@extends('layouts.adminLayout.admin_design')
@section('content')


<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="index.html" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a> <a href="#">Products Image</a> <a href="#" class="current">Validation</a> </div>
    <h1>Add Product Images</h1>
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
  <div class="container-fluid"><hr>
    <div class="row-fluid">
      <div class="span12">
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-info-sign"></i> </span>
            <h5>Add Product Attribute</h5>
          </div>
          <div class="widget-content nopadding">
            <form enctype="multipart/form-data" class="form-horizontal" method="post" action="{{url('/admin/add-images/'.$productDetails->id)}}" name="add_product" id="add_image" novalidate="novalidate"> {{ csrf_field()}}
    


             
    <input type="hidden" nam="product_id" value="{{$productDetails->id}}">
             

              <div class="control-group">
                <label class="control-label">Product Name</label>
                <label class="control-label"> <strong> {{$productDetails->product_name}}</strong></label>
                
              </div>

              <div class="control-group">
                <label class="control-label">Product Code</label>
                <label class="control-label"> <strong> {{$productDetails->product_code}}</strong></label>
              </div>

             
              <div class="control-group">
                <label class="control-label">Product Image</label>
                <div class="controls">
                  <input type="file" name="image[]" id="image" multiple="multiple  ">
                </div>
              </div>

           
            
              <div class="form-actions">
                <input type="submit" value="Add Image" class="btn btn-success" id="add_product">
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
    

    
    <div class="row-fluid">

<div class="span12">

  <div class="widget-box">
    <div class="widget-title"> <span class="icon"><i class="icon-th"></i></span>
      <h5>View Attribute</h5>
    </div>
    <div class="widget-content nopadding">
    <table class="table table-bordered data-table">
        <thead>
          <tr>
          <th> ID</th>
              <th>Product ID</th>
            <th>Image</th>
          
            <th>Action</th>
          </tr>
        </thead>
        <tbody>
            @foreach($productsImage as $image)
          <tr class="gradeX">
          <td>{{$image->id}}</td>
            <td>{{$image->product_id}}</td>
            <td>
                  <img src="{{asset('img/backend_images/products/small/'.$image->image)}}" style="width:50px;" >
                  </td>
           
           
            <td class="center">
            
       <a id ="delProduct" href="{{url('/admin/delete-multipleImage/'.$image->id)}}" class="btn btn-danger btn-mini">Delete</a></td>

            


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