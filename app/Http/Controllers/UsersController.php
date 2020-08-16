<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;

class UsersController extends Controller
{
    public function register(Request $request){
        if($request->isMethod('post')){
            $data = $request->all();
            // $data = json_decode(json_encode($data));
            // echo "<pre>"; print_r($data);die;
            $checkemail = User::where('email',$data['email'])->count();
            if($checkemail>0){
                return redirect()->back()->with('flash_message_error','Email already exists');
            }else{
                echo "sucess";die;
            }
        }
        return view('users.login_register');
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
}
