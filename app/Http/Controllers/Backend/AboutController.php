<?php

namespace App\Http\Controllers\Backend;

use App\Models\About;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\UpdateAboutRequest;

class AboutController extends Controller
{

    public function index()
    {
        $about = About::first();
        return view('backend.about.index', compact('about'));
    }


    public function update(UpdateAboutRequest $request)
    {
        $about = About::first();
        $about->update($request->all());

        if ($request->hasFile('image')) {
            $about
                ->addMedia($request->image)
                ->toMediaCollection('image');
        }

        if ($request->hasFile('image_header')) {
            $about
                ->addMedia($request->image_header)
                ->toMediaCollection('image_header');
        }

        $request->session()->flash('flash_notification', [
            "level" => "info",
            "message" => "Data has been updated successfully"
        ]);
        return redirect()->back();
    }
}
