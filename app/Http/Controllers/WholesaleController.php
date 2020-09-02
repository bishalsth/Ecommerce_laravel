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
}
