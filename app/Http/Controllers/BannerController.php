<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Image;
use App\Banner;
use Illuminate\Support\Facades\Input;
use App\ProductsImage;

class BannerController extends Controller
{
    public function addBanner(Request $request){
        if($request->isMethod('post')){
            $data = $request->all();

            // $data =json_decode(json_encode($data));
            // echo "<pre>"; print_r($data);die;
            $banner = new banner;
            $banner->title = $data['title'];
            $banner->link = $data['link'];

            if(empty($data['status'])){
                $status = 0;
            }else{
                $status =1;
            }
            $banner->status = $status;

            //for image
            if($request->hasFile('image')){
                $image_tmp = $request->file('image'); 
                if($image_tmp->isValid()){
                    
                   $extension = $image_tmp->getClientoriginalExtension();
                   $filename = rand(111,99999).'.'.$extension;
                   $large_image_path ='img/frontend_images/banners/'.$filename;
                   

                   //REsize images
                   Image::make($image_tmp)->save($large_image_path);
                   
                   $banner->image =$filename;
                }
                
           }
            $banner->save();
            return redirect()->back()->with('flash_message_success','Banner has been added successfully');

        }
        
        return view('admin.banner.add_banner');
     
    }

    public function viewBanner(Request $request){
        // echo "test";die;
        $banners = Banner::get();
        return view('admin.banner.view_banner')->with(compact('banners'));
    }

    public function deleteBanner($id=null){
        Banner::where(['id'=>$id])->delete();
        return redirect()->back()->with('flash_message_success','Banner successfully deleted');
    }

    public function editBanner(Request $request,$id=null){


        if($request->isMethod('post')){
            $data= $request->all();
            if($request->hasFile('image')){
                $image_tmp = $request->file('image'); 
                if($image_tmp->isValid()){
                    
                   $extension = $image_tmp->getClientoriginalExtension();
                   $filename = rand(111,99999).'.'.$extension;
                   $large_image_path ='img/frontend_images/banners/'.$filename;
                

                   //REsize images
                   Image::make($image_tmp)->save($large_image_path);
                  
                   
                }
                
           }
           if(empty($data['status'])){
            $status = 0;
        }else{
            $status =1;
        }


        Banner::where(['id'=>$id])->update(['title'=>$data['title'],
        'link'=>$data['link'],'image'=>$filename,'status'=>$status]);
        return redirect()->back()->with('flash_message_success','Banner has updated successfully');

        }

        $bannerDetails = Banner::find($id);
      
        
        return view('admin.banner.edit_banner')->with(compact('bannerDetails'));
    }
}
