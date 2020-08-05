<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use Image;
use Auth;
use Session;
use App\Category;
use App\Product;
use App\ProductsAttribute;

class ProductsController extends Controller
{
    public function addProduct(Request $request){

        if($request->isMethod('post')){
            $data = $request->all();
            // echo "<pre>"; print_r($data); die;
            if(empty($data['category_id'])){
                return redirect()->back()->with('flash_message_error','Under Category is missing');

            }
            $product = new Product;
            $product->category_id= $data['category_id'];
            $product->product_name=$data['product_name'];
            $product->product_code=$data['product_code'];
            $product->product_color=$data['product_color'];
            $product->description=$data['description'];
            $product->care=$data['care'];
            $product->price=$data['product_price'];

            //for image
            if($request->hasFile('image')){
                 $image_tmp = $request->file('image'); 
                 if($image_tmp->isValid()){
                     
                    $extension = $image_tmp->getClientoriginalExtension();
                    $filename = rand(111,99999).'.'.$extension;
                    $large_image_path ='img/backend_images/products/large/'.$filename;
                    $medium_image_path ='img/backend_images/products/medium/'.$filename;
                    $small_image_path ='img/backend_images/products/small/'.$filename;

                    //REsize images
                    Image::make($image_tmp)->save($large_image_path);
                    Image::make($image_tmp)->resize(600,600)->save($medium_image_path);
                    Image::make($image_tmp)->resize(300,300)->save($small_image_path);
                    $product->image =$filename;
                 }
                 
            }
            
            $product->save();
            return redirect()->back()->with('flash_message_success','Product has been added successfully');
        }

        $categories = Category::where(['parent_id'=>0])->get();
        $categories_dropdown = "<option selected disabled>Select</option>";
        foreach($categories as $cat){
            $categories_dropdown .= "<option value='".$cat->id."'>".$cat->name."</option>";
            $sub_categories = Category::where(['parent_id'=>$cat->id])->get();
            foreach($sub_categories as $sub_cat){
                $categories_dropdown .="<option value = '".$sub_cat->id."'>&nbsp;--&nbsp;".$sub_cat->name."</option>";
            }
        }
        return view('admin.products.add_product')->with(compact('categories_dropdown'));
    }

    public function viewProduct(){
        $products = Product::get();
        $products = json_decode(json_encode($products));
       foreach($products as $key => $val){
           $category_name = Category::where(['id'=>$val->category_id])->first();
           $products[$key]->category_name = $category_name->name;

       }
        // echo "<pre>"; print_r($products);die;
        return view('admin.products.view_products')->with(compact('products'));
    }

    public function editProduct(Request $request, $id = null){

        if($request->isMethod('post')){
            $data = $request->all();
            // echo "<pre>"; print_r($data);die;

            if($request->hasFile('image')){
                $image_tmp = $request->file('image'); 
                if($image_tmp->isValid()){
                    
                   $extension = $image_tmp->getClientoriginalExtension();
                   $filename = rand(111,99999).'.'.$extension;
                   $large_image_path ='img/backend_images/products/large/'.$filename;
                   $medium_image_path ='img/backend_images/products/medium/'.$filename;
                   $small_image_path ='img/backend_images/products/small/'.$filename;

                   //REsize images
                   Image::make($image_tmp)->save($large_image_path);
                   Image::make($image_tmp)->resize(600,600)->save($medium_image_path);
                   Image::make($image_tmp)->resize(300,300)->save($small_image_path);
                   
                }
                
           }else{
                $filename = $data['current_image'];
           }


            Product::where(['id'=>$id])->update(['category_id'=>$data['category_id'],
            'product_name'=>$data['product_name'],'product_code'=>$data['product_code'],'product_color'=>$data['product_color'],
            'description'=>$data['description'],'care'=>$data['care'],'price'=>$data['product_price'],'image'=>$filename]);
            return redirect()->back()->with('flash_message_success','Product has updated successfully');
        }

        $productDetails = Product::where(['id'=>$id])->first();


        $categories = Category::where(['parent_id'=>0])->get();
        $categories_dropdown = "<option selected disabled>Select</option>";
        foreach($categories as $cat){

            if($cat->id == $productDetails->category_id){
                $selected = "selected";
            }
            else{
                $selected = "";
            }
            $categories_dropdown .= "<option value='".$cat->id."' ".$selected.">".$cat->name."</option>";
            $sub_categories = Category::where(['parent_id'=>$cat->id])->get();
            foreach($sub_categories as $sub_cat){
                if($sub_cat->id == $productDetails->category_id){
                    $selected = "selected";
                }
                else{
                    $selected = "";
                }

                $categories_dropdown .="<option value = '".$sub_cat->id."' ".$selected.">&nbsp;--&nbsp;".$sub_cat->name."</option>";
            }
        }

        return view('admin.products.edit_products')->with(compact('productDetails','categories_dropdown'));
    }

    public function deleteProductImage($id= null){
        Product::where(['id'=>$id])->update(['image'=>'']);
        return redirect()->back()->with('flash_message_success','Products Image has been deleted');

    }

    public function deleteProduct($id= null){
        Product::where(['id'=>$id])->delete();
        return redirect()->back()->with('flash_message_success','Product has been successfullty deleted');
    }
     
    public function addAttribute(Request $request, $id = null){
        $productDetails = Product::with('attributes')->where(['id'=>$id])->first();
        // $productDetails = json_decode(json_encode($productDetails));
        // echo "<pre>"; print_r($productDetails); die;



        if($request->isMethod('post')){
            $data = $request->all();
            // echo "<pre>"; print_r($data);die;
            foreach($data['sku'] as $key => $val){
                if(!empty($val)){
                    $aatrCountSKU = ProductsAttribute::where('sku',$val)->count();
                    if($aatrCountSKU>0){
                        return redirect('admin/add-attribute/'.$id)->with('flash_message_error','SKU already exists! Please add another SKU');  
                    }

                    //prevent Size

                    $attrCOuntSize = ProductsAttribute::where(['product_id'=>$id,'size'=>$data['size'][$key]])->count();
                    if($attrCOuntSize>0){
                        return redirect('admin/add-attribute/'.$id)->with('flash_message_error','Size already exists! Please add another Size'); 
                    }

                    $attribute = new ProductsAttribute;
                    $attribute->product_id = $id;
                    $attribute->sku = $val;
                    $attribute->size = $data['size'][$key];
                    $attribute->price = $data['price'][$key];
                    $attribute->stock = $data['stock'][$key];
                    $attribute->save();
                    


                }
            }
            return redirect('admin/add-attribute/'.$id)->with('flash_message_success','Product attributes has been added successffully');

        }
        return view ('admin.products.add_attributes')->with(compact('productDetails'));
    }

    public function deleteAttribute($id =null){
        ProductsAttribute::where(['id'=>$id])->delete();
        return redirect()->back()->with('flash_message_success','Attributes deleted successfully');
    }

    public function listingProduct($url = null){
        // echo $url;die;
        $categories = Category::with('categories')->where(['parent_id'=>0])->get();
        $categoryDetails = Category::where(['url'=>$url])->first();
        if($categoryDetails->parent_id==0){
            //if url is main category
            $subcategories = Category::where(['parent_id'=>$categoryDetails->id])->get();
           
            foreach($subcategories as $subcat){
                $cat_ids[] = $subcat->id;
            }
            // echo $cat_ids;die;
            $productsAll = Product::whereIn('category_id',$cat_ids)->get();

        }else{
            //if url is sub category
            $productsAll = Product::where(['category_id'=>$categoryDetails->id])->get();
        }
        
        
        return view('products.listing')->with(compact('productsAll','categories','categoryDetails'));


    }

    public function product($id=null){
        $categories = Category::with('categories')->where(['parent_id'=>0])->get();

        $productDetails = Product::with('attributes')->where('id',$id)->first();
        // $productDetails = json_decode(json_encode($productDetails));
        // echo "<pre>"; print_r($productDetails);die;
        return view('products.detail')->with(compact('productDetails','categories'));
    }

    public function getProductPrice(Request $request){
        $data = $request->all();
        // echo "<pre>";print_r($data);die;
        $proArr = explode("-",$data['idSize']);
        // echo $proArr[0]; echo $proArr[1];die;
        $proAttr =ProductsAttribute::where(['product_id'=>$proArr[0], 'size'=>$proArr[1]])->first();

        echo $proAttr->price;

    }

}
