<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use App\Country;
use Auth;
use Session;
use Illuminate\Support\Facades\Hash;
use App\Product;
use App\Category;
use App\Banner;
use App\ProductsImage;
use App\ProductsAttribute;
use DB;
use App\DeliveryAddress;
use App\Order;
use App\OrdersProduct;

class WholesaleController extends Controller
{
    public function wholesaleLogin(){
        return view ('wholesale.login');
    }


    public function register(Request $request){
        if($request->isMethod('post')){
            $data = $request->all();
            // $data = json_decode(json_encode($data));
            // echo "<pre>"; print_r($data);die;
            $checkemail = User::where('email',$data['email'])->count();
            if($checkemail>0){
                return redirect()->back()->with('flash_message_error','Email already exists');
            }else{
               $user = new User;
               $user->C_name = $data['C_name'];
               $user->pincode = $data['pincode'];
               $user->address = $data['address'];
               $user->country = $data['country'];
               $user->city = $data['city'];
               $user->state = $data['state'];
               $user->zip = $data['zip'];
               $user->mobile = $data['phone'];
               $user->vat = $data['vat'];

               $user->name = $data['name'];
               $user->email = $data['email'];
               $user->password = bcrypt($data['password']);

               if(!empty($data['address'])){
                     $user->address = $data['address'];
                     }else{
                          $user->address = '';
                          }
                          if(!empty($data['city'])){
                                $user->city = $data['city'];
                                }else{
                                     $user->city = '';
                                     }

                                     if(!empty($data['country'])){
                                           $user->country = $data['country'];
                                           }else{
                                                $user->country = '';
                                                }

                                                if(!empty($data['pincode'])){
                                                      $user->pincode = $data['pincode'];
                                                      }else{
                                                           $user->pincode = '';
                                                           }

                                                           if(!empty($data['phone'])){
                                                                 $user->mobile = $data['phone'];
                                                                 }else{
                                                                      $user->mobile = '';	
                                                                      }

                                                                      if(empty($data['status'])){
                                                                        $status = 0;
                                                                    }else{
                                                                        $status =2;
                                                                    }
                                                                    $user->admin = $status;



               $user->save();
               if(Auth::attempt(['email'=>$data['email'],'password'=>$data['password']])){
                    // echo "success";die;
                    Session::put('WholesaleSession',$data['email']);
                   return redirect('/wholesale-board');
               }

            }
        }

    }

    public function dashboard(){
        $productsAll = Product::inRandomOrder()->where('status',1)->get();

        $categories = Category::with('categories')->where(['parent_id'=>0])->get();
        // $categories = json_decode(json_encode($categories));

        // echo "<pre>"; print_r($categories); die;
        $banners = Banner::where('status','1')->get();

        return view('wholesale.wholesale')->with(compact('productsAll','categories','banners'));
        
    }

    public function login(Request $request){
        $data = $request->all();
        // echo "<pre>"; print_r($data); die;
        if(Auth::attempt(['email'=>$data['email'],'password'=>$data['password'],'admin'=>'2'])){
            Session::put('WholesaleSession',$data['email']);
            
            return redirect('/wholesale-board');
        }else{
            return redirect()->back()->with('flash_message_error','Invalid email or password');
        }

    }

    public function product(Request $request,$id=null){
        $data= $request->all();

        // $quantity = $data['quantity'];
        // echo "<pre>";print_r($quantity);die;
        $categories = Category::with('categories')->where(['parent_id'=>0])->get();

        $alternateImage = ProductsImage::where(['product_id'=>$id])->get();

        $TotalStock = ProductsAttribute::where('product_id',$id)->sum('stock');
      
       
        $productDetails = Product::with('attributes')->where('id',$id)->first();
      

        $relatedProducts = Product::where('id','!=',$id)->where(['category_id'=>$productDetails->category_id])->get();
     


        
        return view('wholesale.w_detail')->with(compact('productDetails','categories','alternateImage','TotalStock','relatedProducts','data'));

       
       

    }

    public function logout(){
        Auth::logout();
        Session::forget('WholesaleSession');
        return redirect('/wholesale-board');

    }

    public function addtoCart(Request $request,$id=null){
        Session::forget('CouponAmount');
        Session::forget('CouponCode');


        $data = $request->all();
        // echo "<pre>"; print_r($data);die; 
       

        if(empty(Auth::user()->email)){
            $data['user_email'] = '';    
        }else{
            $data['user_email'] = Auth::user()->email;
        }

        $session_id =Session::get('session_id');
        if(empty($session_id)){
            $session_id = Str::random(40);
            Session::put('session_id',$session_id);
        }
       

        $sizeArr = explode("-",$data['size']);

        $contProducts =  DB::table('cart')->where(['product_id'=>$data['product_id'],
        'product_color'=>$data['product_color'],
        'size'=>$sizeArr[1],'session_id'=>$session_id])->count();

        // echo $contProducts;die;
        if($contProducts>0){
            return redirect()->back()->with('flash_message_error','Product already exist!'); 

        }else{
            $getsku = ProductsAttribute::select('sku')->where(['product_id'=>$data['product_id'],'size'=>$sizeArr[1]])->first();
            DB::table('cart')->insert(['product_id'=>$data['product_id'],'product_name'=>$data['product_name'],
            'product_code'=>$getsku->sku,'product_color'=>$data['product_color'],'price'=>$data['price'],
            'size'=>$sizeArr[1],'user_email'=>$data['user_email'],'quantity'=>$data['quantity'],'session_id'=>$session_id]);

        }
        
      

        return redirect('/cart-wholesale')->with('flash_message_success','Product has been added to Cart');

    }

    public function cart($id=null){
       

        if(Auth::check()){
            $user_email = Auth::user()->email;
            $userCart = DB::table('cart')->where(['user_email' => $user_email])->get();     
        }else{
            $session_id = Session::get('session_id');
            $userCart = DB::table('cart')->where(['session_id' => $session_id])->get();    
        }
       
        
        foreach($userCart as $key => $cart){
            // echo $cart->product_id;
            $productDetails = Product::where('id',$cart->product_id)->first();
             $userCart[$key]->image=$productDetails->image;
        }

        // echo "<pre>";print_r($userCart);die;


        return view('wholesale.cart_wholesale')->with(compact('userCart'));
    }

    public function checkout(Request $request){
        $user_id = Auth::user()->id;
        $user_email=Auth::user()->email;
        $userDetails = User::find($user_id);
        $countries = Country::get();

        //Check if Shipping address exists

        $shippingCount = DeliveryAddress::where('user_id',$user_id)->count();
        $shippingDetails = array();
     
        if($shippingCount>0){
            $shippingDetails = DeliveryAddress::where('user_id',$user_id)->first();
        }

        //Update cart table with user email
        $session_id = Session::get('session_id');
        // echo "<pre>";print_r($session_id);die;
        DB::table('cart')->where(['session_id'=>$session_id])->update(['user_email'=>$user_email]);

        if($request->isMethod('post')){
            $data = $request->all();
            // echo "<pre>";print_r($data);die;

            //Return to Checkout page if  any of the field is empty
            // if(empty($data['biiling_name']) || empty($data['billing_address']) || empty($data['billing_city']) ||
            // empty($data['billing_state']) ||empty($data['billing_country']) ||empty($data['billing_pincode']) ||
            // empty($data['billing_mobile']) ||empty($data['shipping_name']) || empty($data['shipping_address']) ||
            // empty($data['shipping_city']) ||empty($data['shipping_state']) ||empty($data['shipping_country']) ||
            // empty($data['shipping_pincode']) ||empty($data['shipping_mobile'])  ){

            //     return redirect()->back()->with('flash_message_error','Please fill all the fields to checkout');

            // }
                User::where('id',$user_id)->update(['name'=>$data['billing_name'],'address'=>$data['billing_address'],
                'city'=>$data['billing_city'],'state'=>$data['billing_state'],'country'=>$data['billing_country'],
                'pincode'=>$data['billing_pincode'],'mobile'=>$data['billing_mobile'],'vat'=>$data['billing_vat']]);

         
                if(($shippingCount>0)){
                    //update useShipping Address
                    DeliveryAddress::where('user_id',$user_id)->update(['name'=>$data['shipping_name'],'address'=>$data['shipping_address'],
                    'city'=>$data['shipping_city'],'state'=>$data['shipping_state'],'country'=>$data['shipping_country'],
                    'pincode'=>$data['shipping_pincode'],'mobile'=>$data['shipping_mobile'],'vat'=>$data['shipping_vat']]);
                }else{
                    //add New shipping address
                    $shipping = new DeliveryAddress;
                    $shipping->user_id=$user_id;
                    $shipping->user_email=$user_email;
                    $shipping->name = $data['shipping_name'];
                    $shipping->address = $data['shipping_address'];
                    $shipping->city = $data['shipping_city'];
                    $shipping->state = $data['shipping_state'];
                    $shipping->country = $data['shipping_country'];
                    $shipping->pincode = $data['shipping_pincode'];
                    $shipping->mobile = $data['shipping_mobile'];
                    $shipping->vat = $data['shipping_vat'];
                    $shipping->save();
                }
                // echo "redirect to order REvview page";die;
                return redirect()->action('WholesaleController@orderReview');

           
        }
        return view('wholesale.checkout_wholesale')->with(compact('userDetails','countries','shippingDetails'));
    }

    public function orderReview(Request $request){
        $user_id = Auth::user()->id;
        $user_email = Auth::user()->email;
        $userDetails = User::where('id',$user_id)->first();
        $shippingDetails = DeliveryAddress::where('user_id',$user_id)->first();

        $userCart = DB::table('cart')->where(['user_email'=>$user_email])->get();
        foreach($userCart as $key => $product){
            $productDetails = Product::where('id',$product->product_id)->first();
            $userCart[$key]->image = $productDetails->image;
        }

        // echo "<pre>";print_r($userCart);die;
        return view('wholesale.order_review_wholesale')->with(compact('userDetails','shippingDetails','userCart'));
    }

    public function placeOrder(Request $request){
        if($request->isMethod('post')){
            $data= $request->all();
            // echo "<pre>";print_r($data);die;
            $user_id = Auth::user()->id;
            $user_email = Auth::user()->email;

            $shippingDetails = DeliveryAddress::where(['user_email'=>$user_email])->first();
            // $shippingDetails=json_decode(json_encode($shippingDetails));
            // echo "<pre>";print_r($shippingDetails);die;

            if(empty(Session::get('CouponCode'))){
              $coupon_code="";
            }else{
                $coupon_code =Session::get('CouponCode');
            }

            if(empty(Session::get('CouponAmount'))){
                $coupon_amount="";
            }else{
                $coupon_amount =Session::get('CouponAmount');
            }
            $order = new Order;
            $order->user_id = $user_id;
            $order->user_email = $user_email;
            $order->name=$shippingDetails->name;
            $order->address=$shippingDetails->address;
            $order->city=$shippingDetails->city;
            $order->state=$shippingDetails->state;
            $order->pincode=$shippingDetails->pincode;
            $order->country=$shippingDetails->country;
            $order->mobile=$shippingDetails->mobile;
            // $order->shipping_charges=;
            $order->coupon_code=$coupon_code;
            $order->coupon_amount=$coupon_amount;
            $order->order_status="New";
            $order->payment_method=$data['payment_method'];
            $order->grand_total=$data['grand_total'];
            $order->save();

            $order_id = DB::getPdo()->lastInsertId();

            $cartProducts = DB::table('cart')->where(['user_email'=>$user_email])->get();
            foreach($cartProducts as $pro){
                $cartPro = new OrdersProduct;
                $cartPro->order_id = $order_id;
                $cartPro->user_id = $user_id;
                $cartPro->product_id = $pro->product_id;
                $cartPro->product_code = $pro->product_code;
                $cartPro->product_name = $pro->product_name;
                $cartPro->product_color = $pro->product_color;
                $cartPro->product_size = $pro->size;
                $cartPro->product_price = $pro->price;
                $cartPro->product_qty = $pro->quantity;
                $cartPro->save();

                Session::put('order_id',$order_id);
                Session::put('grand_total',$data['grand_total']);
                 return redirect('/thanks-wholesale');

            

            }

        }
    }




    public function thanks(){
        $user_email = Auth::user()->email;
        DB::table('cart')->where('user_email',$user_email)->delete();         
        return view('wholesale.thanks_wholesale');
    }
}
