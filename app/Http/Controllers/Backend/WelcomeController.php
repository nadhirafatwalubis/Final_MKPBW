<?php

namespace App\Http\Controllers\Backend;

use App\Models\Welcome;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\UpdateWelcomeRequest;

class WelcomeController extends Controller
{

    public function index()
    {
        $welcome = Welcome::first();
        return view('backend.welcome.index', compact('welcome'));
    }


    public function update(UpdateWelcomeRequest $request)
    {
        $welcome = Welcome::first();
        $welcome->update($request->all());

        if ($request->hasFile('image')) {
            $welcome
                ->addMedia($request->image)
                ->preservingOriginal()
                ->toMediaCollection('image');
        }
        $request->session()->flash('flash_notification', [
            "level" => "info",
            "message" => "Data has been updated successfully"
        ]);
        return redirect()->back();
    }
}
