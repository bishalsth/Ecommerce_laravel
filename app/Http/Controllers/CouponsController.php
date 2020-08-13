<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Coupon;
class CouponsController extends Controller
{
    public function addCoupon(Request $request){
        if($request->isMethod('post')){
            $data = $request->all();
            // echo "<pre>"; print_r($data);die;
            $coupon =new Coupon;
            $coupon->coupon_code = $data['coupon_code'];
            $coupon->amount = $data['amount'];
            $coupon->amount_type = $data['amount_type'];
            $coupon->expiry_date =$data['expiry_date'];
            $coupon->status = $data['status'];
            $coupon->save();
            return redirect('/admin/view-coupon')->with('flash_message_success','Coupons added Successfully');
        }
        return view('admin.coupon.add_coupon');
    }

    public function viewCoupon(){
        $coupons = Coupon::get();
        return view('admin.coupon.view_coupon')->with(compact('coupons'));
    }
}
