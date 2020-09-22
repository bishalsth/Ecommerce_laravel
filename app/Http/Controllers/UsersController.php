<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use App\Country;
use Auth;
use Session;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;

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


                

                // Send Confirmation email
                $email = $data['email'];
                $messageData = ['email'=>$data['email'],'name'=>$data['name'],'code'=>base64_encode($data['email'])];
                Mail::send('email.confirmation',$messageData,function($message) use($email)
                {   
                    $message->to($email)->subject('Confirm Your email');

                });

                return redirect()->back()->with('flash_message_success','Please confirm your email to activate your account');


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
        Session::forget('session_id');
        return redirect('/');

    }

    public function login(Request $request){
        $data = $request->all();
        // echo "<pre>"; print_r($data); die;
        if(Auth::attempt(['email'=>$data['email'],'password'=>$data['password']])){

            $userStatus = User::where('email',$data['email'])->first();
            if($userStatus->status == 0){
                return redirect()->back()->with('flash_message_error','Your account is not activated! Please confirm your email to activate ');  
            }

            Session::put('frontSession',$data['email']);
            return redirect('cart');
        }else{
            return redirect()->back()->with('flash_message_error','Invalid email or password');
        }

    }

    public function confirmAccount($email){
        // echo "hello";die;
        $email= base64_decode($email);
        $userCount= User::where('email',$email)->count();
        // echo $userCount;die;
        if($userCount >0){
            $userDetails= User::where('email',$email)->first();
            if($userDetails->status == 1){
                return redirect('login-register')->with('flash_message_success','Your email is already activated');
            }else{
                User::where('email',$email)->update(['status'=>'1']);

                // Send Register Email
                
                $messageData = ['email'=>$email,'name'=>$userDetails->name];
                Mail::send('email.welcome',$messageData,function($message) use($email)
                {   
                    $message->to($email)->subject('Welcome to E-com Website');

                });
                return redirect('login-register')->with('flash_message_success','Your email is  activated.You can login now');
            }
        }else{
            abort(404);
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

    public function changePassword(Request $request){
        $data= $request->all();
        // echo "<pre>"; print_r($data);die;
        // $old_pwd= User::where('id',Auth::User()->id)->first();
        // $current_pwd= $data['confirm_pwd']
        $new_pwd = bcrypt($data['new_pwd']);
        User::where('id',Auth::User()->id)->update(['password'=>$new_pwd]);
        return redirect()->back()->with('flash_message_success','Password updated Successfully');
    }

    public function contact(){
        return view('contact');
    }

    public function test(){
        return view('test');
    }
}
