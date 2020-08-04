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

ROute::match(['get','post'],'/admin','AdminController@login');

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
    Route::get('/admin/delete-attribute/{id}','ProductsController@deleteAttribute');

});


Route::get('/logout','AdminController@logout');