<?php

use UniSharp\LaravelFilemanager\Lfm;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\BlogController;
use App\Http\Controllers\FrontendController;
use App\Http\Controllers\Backend\HomeController;
use App\Http\Controllers\Backend\PostController;
use App\Http\Controllers\Backend\UserController;
use App\Http\Controllers\Backend\AboutController;
use App\Http\Controllers\Backend\HeaderController;
use App\Http\Controllers\Backend\BookingController;
use App\Http\Controllers\Backend\ContactController;
use App\Http\Controllers\Backend\GalleryController;
use App\Http\Controllers\Backend\WelcomeController;
use App\Http\Controllers\Backend\TestimonyController;
use App\Http\Controllers\Backend\WebSettingController;
use App\Http\Controllers\Backend\DestinationController;
use App\Http\Controllers\Backend\PostCategoryController;

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




Route::get('/', [FrontendController::class, 'index'])->name('/');

// about
Route::get('/about', [FrontendController::class, 'about'])->name('about');

// destination
Route::get('/destination', [FrontendController::class, 'destination'])->name('destination');
Route::get('/destination/{destination:slug}', [FrontendController::class, 'destinationShow'])->name('destination.show');

// gallery
Route::get('/gallery', [FrontendController::class, 'gallery'])->name('gallery');
Route::get('/gallery/{gallery:slug}', [FrontendController::class, 'galleryShow'])->name('gallery.show');


// blog post
Route::get('/blog', [BlogController::class, 'index'])->name('blog');
Route::get('/blog/{blog}', [BlogController::class, 'show'])->name('blog.show');
Route::get('/category/{category:slug}', [BlogController::class, 'category'])->name('category');
Route::get('/author/{author:slug}', [BlogController::class, 'author'])->name('author');
Route::get('/tag/{tag:slug}', [BlogController::class, 'tag'])->name('tag');

// booking
Route::post('/booking', [FrontendController::class, 'booking'])->name('booking');

Route::get('/contact', [FrontendController::class, 'contact'])->name('contact');
Route::post('/contact', [FrontendController::class, 'contactStore'])->name('contact.store');

Route::group(['prefix' => 'admin', 'middleware' => ['auth']], function () {

    Route::get('/home', [HomeController::class, 'index'])->name('home');

    // Post
    Route::get('/anydata', [PostController::class, 'anydata'])->name('anydata');
    Route::delete('post/destroy', [PostController::class, 'destroy'])->name('post.destroy');
    Route::post('post/restore', [PostController::class, 'restore'])->name('post.restore');
    Route::delete('post/force-destroy', [PostController::class, 'forceDestroy'])->name('post.forceDestroy');
    Route::get('post/checkStatus', [PostController::class, 'statusList'])->name('post.checkStatus');
    Route::get('post/checkSlug', [PostController::class, 'checkSlug'])->name('post.checkSlug');
    Route::resource('post', PostController::class)->except('show', 'destroy');

    // Category
    Route::get('post-category/checkSlug', [PostCategoryController::class, 'checkSlug'])->name('post-category.checkSlug');
    Route::resource('post-category', PostCategoryController::class)->except('show');

    // About
    Route::get('about', [AboutController::class, 'index'])->name('about.index');
    Route::post('about/update', [AboutController::class, 'update'])->name('about.update');

    // Welcome
    Route::get('welcome', [WelcomeController::class, 'index'])->name('welcome.index');
    Route::post('welcome/update', [WelcomeController::class, 'update'])->name('welcome.update');

    // Testimony
    Route::resource('testimony', TestimonyController::class)->except('show');

    // Destination
    Route::get('destination/checkSlug', [DestinationController::class, 'checkSlug'])->name('destination.checkSlug');
    Route::post('destination/media', [DestinationController::class, 'storeMedia'])->name('destination.storeMedia');
    Route::post('destination/delete-media', [DestinationController::class, 'deleteMedia'])->name('destination.deleteMedia');
    Route::resource('destination', DestinationController::class)->except('show');

    // Gallery
    Route::get('gallery/checkSlug', [GalleryController::class, 'checkSlug'])->name('gallery.checkSlug');
    Route::post('gallery/media', [GalleryController::class, 'storeMedia'])->name('gallery.storeMedia');
    Route::post('gallery/delete-media', [GalleryController::class, 'deleteMedia'])->name('gallery.deleteMedia');
    Route::resource('gallery', GalleryController::class)->except('show');

    // Contact
    Route::get('contact', [ContactController::class, 'index'])->name('contact.index');
    Route::post('contact/{contact}', [ContactController::class, 'read'])->name('contact.read');

    // Booking
    Route::get('booking', [BookingController::class, 'index'])->name('booking.index');
    Route::post('booking/{booking}', [BookingController::class, 'read'])->name('booking.read');

    // Welcome
    Route::get('header', [HeaderController::class, 'index'])->name('header.index');
    Route::post('header/update', [HeaderController::class, 'update'])->name('header.update');

    Route::get('setting/website', [WebSettingController::class, 'website'])->name('setting.web');
    Route::post('setting/update', [WebSettingController::class, 'update'])->name('setting.update');

    Route::get('user/checkSlug', [UserController::class, 'checkSlug'])->name('user.checkSlug');
    Route::post('user/reset/{user:slug}', [UserController::class, 'reset'])->name('user.reset');
    Route::resource('user', UserController::class)->except('update', 'edit');
});

Route::group(['prefix' => 'laravel-filemanager', 'middleware' => ['web', 'auth']], function () {
    Lfm::routes();
});
