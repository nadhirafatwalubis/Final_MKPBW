<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\Models\Post;
use App\Models\About;
use App\Models\Header;
use App\Models\Booking;
use App\Models\Contact;
use App\Models\Gallery;
use App\Models\Welcome;
use App\Models\Testimony;
use App\Models\Destination;
use Illuminate\Support\Str;
use Jenssegers\Agent\Agent;
use Illuminate\Http\Request;
use Artesaos\SEOTools\Facades\SEOTools;
use Illuminate\Support\Facades\Validator;

class FrontendController extends Controller
{
    public function index()
    {
        SEOTools::setTitle(config('settings.site_title'));
        SEOTools::setDescription(config('settings.site_desc'));
        SEOTools::addImages(asset('images/' . config('settings.og_image')));

        $header       = Header::first();
        $welcome      = Welcome::first();
        $destinations = Destination::with('media')->latest()->limit(6)->get();
        $posts        = Post::with('media')->published()->latest()->limit(3)->get();
        $testimonies  = Testimony::with('media')->randomLimit()->get();

        return view('frontend.welcome', compact('header', 'welcome', 'destinations', 'posts', 'testimonies'));
    }

    public function about()
    {
        $about       = About::first();
        $welcome = Welcome::first();
        $testimonies = Testimony::with('media')->randomLimit()->get();

        SEOTools::setTitle($about->title . ' - ' . config('settings.site_name'));
        SEOTools::setDescription($about->desc);
        SEOTools::addImages($about->image_url);

        return view('frontend.about.index', compact('welcome', 'about', 'testimonies'));
    }

    public function destination()
    {
        $destinations = Destination::with('media')->latest()->paginate(6);

        SEOTools::setTitle(config('settings.site_title'));
        SEOTools::setDescription(config('settings.site_desc'));
        SEOTools::addImages(asset('images/' . config('settings.og_image')));

        return view('frontend.destination.index', compact('destinations'));
    }

    public function destinationShow(Destination $destination)
    {
        SEOTools::setTitle($destination->name . ' - ' . config('settings.site_name'));
        SEOTools::setDescription($destination->desc_meta);
        SEOTools::addImages($destination->cover_url);

        views($destination)->record();
        $destinations = Destination::all()->pluck('name', 'id');

        return view('frontend.destination.show', compact('destination', 'destinations'));
    }

    public function gallery()
    {
        SEOTools::setTitle(config('settings.site_title'));
        SEOTools::setDescription(config('settings.site_desc'));
        SEOTools::addImages(asset('images/' . config('settings.og_image')));
        $galleries = Gallery::with('media')->latest()->paginate(6);

        return view('frontend.gallery.index', compact('galleries'));
    }

    public function galleryShow(Gallery $gallery)
    {
        SEOTools::setTitle($gallery->name . ' - ' . config('settings.site_name'));
        SEOTools::setDescription($gallery->desc_meta);
        SEOTools::addImages($gallery->cover_url);

        return view('frontend.gallery.show', compact('gallery'));
    }

    public function contact()
    {
        SEOTools::setTitle(config('settings.site_title'));
        SEOTools::setDescription(config('settings.site_desc'));
        SEOTools::addImages(asset('images/' . config('settings.og_image')));

        return view('frontend.contact.index');
    }

    public function booking(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name'          => 'required',
            'checkin_date'  => 'required|after_or_equal:today',
            'checkout_date' => 'required|after_or_equal:checkin_date',
            'phone'         => 'required',
            'destination'   => 'required|exists:destinations,slug'
        ]);

        if ($validator->fails()) {
            return response()->json(['status' => 0, 'error' => $validator->errors()->toArray()]);
        } else {


            $destination = Destination::where('slug', $request->destination)->first();

            $name             = trim($request->name);
            $checkin          = trim($request->checkin_date);
            $checkout         = trim($request->checkout_date);
            $phone            = trim($request->phone);
            $destinationName  = trim($destination->name);
            $destinationPrice = trim($destination->price_formated);

            $message       = "Hallo, I want booking a Destination\n";
            $message       .= "Name : *{$name}*\n";
            $message       .= "Checkin Date : *{$checkin}*\n";
            $message       .= "Checkout Date : *{$checkout}*\n";
            $message       .= "Destination : *{$destinationName}*\n";
            $message       .= "Destination Price : *Rp. {$destinationPrice}*";

            $booking = new Booking;

            $booking->checkin_date  = $checkin;
            $booking->checkout_date = $checkout;
            $booking->name          = $name;
            $booking->phone         = $phone;
            $booking->destination_id       = $destination->id;

            $booking->save();

            if ($booking) {
                return response()->json(['status' => 1, 'url' => $this->whatsapp($message)]);
            }
        }
    }



    public function contactStore(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name'    => 'required',
            'email'   => 'required',
            'subject' => 'required',
            'message' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['status' => 0, 'error' => $validator->errors()->toArray()]);
        } else {

            $name     = trim($request->name);
            $email  = trim($request->email);
            $subject = trim($request->subject);
            $msg    = trim($request->message);

            $message       = "Hallo,\n";
            $message       .= "Name : *{$name}*\n";
            $message       .= "Email : *{$email}*\n";
            $message       .= "Subject : *{$subject}*\n\n";
            $message       .= "Message : {$msg}\n";

            $contact = new Contact();

            $contact->name    = $request->name;
            $contact->email   = $request->email;
            $contact->subject = $request->subject;
            $contact->message = $request->message;

            $contact->save();

            if ($contact) {
                return response()->json(['status' => 1, 'url' => $this->whatsapp($message)]);
            }
        }
    }

    public function whatsapp($message)
    {
        $walink = 'https://web.whatsapp.com/send';

        $agent = new Agent();
        if ($agent->isMobile()) {
            $walink = 'whatsapp://send';
        }

        $about = About::first();
        $wa = $about->wa_formated;
        $messageEncode = urlencode($message);
        $url = $walink . '?phone=' . $wa . '&text=' . $messageEncode;

        return $url;
    }
}
