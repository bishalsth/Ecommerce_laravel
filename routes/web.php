<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Route::get('/', function () {
//     return view('welcome');
// });
Route::get('/','IndexController@index');

Route::get('/products/{url}','ProductsController@listingProduct');
Route::get('/product/{id}','ProductsController@product');

Route::get('/get-product-size','ProductsController@getProductPrice');

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
Auth::routes();

Route::match(['get','post'],'/admin','AdminController@login');

//Add to cart
Route::match(['get','post'],'/add-cart','ProductsController@addtoCart');

//Delete Cart
Route::get('/delete-cart/{id}','ProductsController@deleteCart');
//update cart
Route::get('/cart/update-cart/{id}/{quantity}','ProductsController@updatecartQuantity');



Route::get('/cart','ProductsController@cart');

Route::group(['middleware' => ['auth']], function(){

    Route::get('/admin/dashboard','AdminController@dashboard');

    Route::match(['get','post'],'/admin/add-category','CategoryController@addCategory');
    Route::get('/admin/view-categories','CategoryController@viewCategory');
    Route::match(['get','post'],'/admin/edit-category/{id}','CategoryController@editCategory');
    Route::match(['get','post'],'/admin/delete-category/{id}','CategoryController@deleteCategory');

    //Route for products
    Route::match(['get','post'],'/admin/add-product','ProductsController@addProduct');
    Route::get('/admin/view-product','ProductsController@viewProduct');
    Route::match(['get','post'],'/admin/edit-product/{id}','ProductsController@editProduct');
    Route::get('/admin/delete-productImage/{id}','ProductsController@deleteProductImage');
    Route::get('/admin/delete-product/{id}','ProductsController@deleteProduct');

    //Route for Products Attributes
    Route::match(['get','post'],'/admin/add-attribute/{id}','ProductsController@addAttribute');
    Route::match(['get','post'],'/admin/edit-attribute/{id}','ProductsController@editAttribute');
    Route::get('/admin/delete-attribute/{id}','ProductsController@deleteAttribute');
    
    //ROute for adding multiple images
    Route::match(['get','post'],'/admin/add-images/{id}','ProductsController@addImages');
    Route::get('/admin/delete-multipleImage/{id}','ProductsController@deleteMultipleImage');

});


Route::get('/logout','AdminController@logout');