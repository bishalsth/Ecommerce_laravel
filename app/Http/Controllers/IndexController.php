<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Product;
use App\Category;
use App\Banner;

class IndexController extends Controller
{
    public function index(){
        $productsAll = Product::inRandomOrder()->where('status',1)->paginate(8);
            // latest Products
        $latestAll = Product::inRandomOrder()->where('status',1)->where('feature_itm',1)->get();


        $categories = Category::with('categories')->where(['parent_id'=>0])->get();
        // $categories = json_decode(json_encode($categories));

        // echo "<pre>"; print_r($categories); die;
        $banners = Banner::where('status','1')->get();

        return view('index')->with(compact('productsAll','categories','banners','latestAll'));
    }
}
