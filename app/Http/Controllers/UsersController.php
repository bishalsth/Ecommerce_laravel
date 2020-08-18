<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use App\Country;
use Auth;
use Session;
use Illuminate\Support\Facades\Hash;

class UsersController extends Controller
{

    public function userLoginRegister(){
        return view('users.login_register');

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
               $user->name = $data['name'];
               $user->email = $data['email'];
               $user->password = bcrypt($data['password']);
               $user->save();
               if(Auth::attempt(['email'=>$data['email'],'password'=>$data['password']])){
                   Session::put('frontSession',$data['email']);
                   return redirect('/cart');
               }

            }
        }
        
    }

    public function checkEmail(Request $request){
        $data = $request->all();
        $checkemail = User::where('email',$data['email'])->count();
            if($checkemail>0){
                return "false";
            }else{
                echo "true";die;
            }

    }

    public function logout(){
        Auth::logout();
        Session::forget('frontSession');
        return redirect('/');

    }

    public function login(Request $request){
        $data = $request->all();
        // echo "<pre>"; print_r($data); die;
        if(Auth::attempt(['email'=>$data['email'],'password'=>$data['password']])){
            Session::put('frontSession',$data['email']);
            return redirect('cart');
        }else{
            return redirect()->back()->with('flash_message_error','Invalid email or password');
        }

    }

    public function account(Request $request){
        $user_id = Auth::user()->id;
        $userdetails = User::find($user_id);

        if($request->isMethod('post')){
            $data= $request->all();
            // echo "<pre>"; print_r($data);die;

            if(empty($data['name'])){
                return redirect()->back()->with('flash_message_error','Please enter your name to update your account');
            }

            if(empty($data['address'])){
                $data['address']="";
            }
            if(empty($data['city'])){
                $data['city']="";
            }
            if(empty($data['country'])){
                $data['country']="";
            }
            if(empty($data['state'])){
                $data['state']="";
            }
            if(empty($data['pincode'])){
                $data['pincode']="";
            }
            if(empty($data['mobile'])){
                $data['mobile']="";
            }

            $user = User::find($user_id);
            $user->name = $data['name'];
            $user->address = $data['address'];
            $user->city = $data['city'];
            $user->state = $data['state'];
            $user->country = $data['country'];
            $user->pincode = $data['pincode'];
            $user->mobile = $data['mobile'];
            $user->save();
            return redirect()->back()->with('flash_message_success','users Details updated successfully');
            
        }
        $countries = Country::get();
        return view('users.account')->with(compact('countries','userdetails'));
    }

    public function password(Request $request){
        $data= $request->all();
        // echo "<pre>"; print_r($data);die;
        $current_pwd = $data['current_pwd'];
        $user_id = Auth::User()->id;
        $check_password = User::where('id',$user_id)->first();
        if(Hash::check($current_pwd,$check_password->password)){
            echo "true";die;
        }else{
            echo "false";die;
        }
    }
}
