
<table style="width:50%; backgorund-color:black;">
  <tr>
  <th>Product Name</th>
        <th>Product Code</th>
        <th>Size</th>
        <th>Color</th>
        <th>Quantity</th>
        <th>Unit Price</th>
  </tr>

  @foreach($productDetails['orders'] as $product)
  <tr>
  
        <td>{{$product['product_name']}}</td>
        <td>{{$product['product_code']}}</td>
        <td>{{$product['product_size']}}</td>
        <td>{{$product['product_color']}}</td>
        <td>{{$product['product_qty']}}</td>
        <td>{{$product['product_price']}}</td>
       

        
        
  </tr>
  @endforeach

<tr>
<td style="align:right;">
Shipping Charges 
</td>
<td>${{$productDetails['shipping_charges']}}</td>
</tr>

<tr>
<td style="align:right;">
Coupon Discount 
</td>
<td>${{$productDetails['coupon_amount']}}</td>
</tr>

<tr>
<td style="align:right;">
Grand Total 
</td>
<td>${{$productDetails['grand_total']}}</td>
</tr>


<table>
<tr>
<td>
<table>
<tr>
<td> Bill to:</td>
</tr>
<tr>
<td> {{$userDetails['name']}}</td>
</tr>

<tr>
<td> {{$userDetails['address']}}</td>
</tr>

<tr>
<td> {{$userDetails['city']}}</td>
</tr>

<tr>
<td> {{$userDetails['state']}}</td>
</tr>

<tr>
<td> {{$userDetails['country']}}</td>
</tr>

<tr>
<td> {{$userDetails['pincode']}}</td>
</tr>

<tr>
<td> {{$userDetails['mobile']}}</td>
</tr>
</table>

</td>

<td>
<table>
<tr>
<td> Ship to:</td>
</tr>
<tr>
<td> {{$productDetails['name']}}</td>
</tr>

<tr>
<td> {{$productDetails['address']}}</td>
</tr>

<tr>
<td> {{$productDetails['city']}}</td>
</tr>

<tr>
<td> {{$productDetails['state']}}</td>
</tr>

<tr>
<td> {{$productDetails['country']}}</td>
</tr>

<tr>
<td> {{$productDetails['pincode']}}</td>
</tr>

<tr>
<td> {{$productDetails['mobile']}}</td>
</tr>
</table>

</td>

</tr>
</table>

</table>

       