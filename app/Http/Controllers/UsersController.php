<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use Auth;
use Session;

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

    public function account(){
        return view('users.account');
    }
}
