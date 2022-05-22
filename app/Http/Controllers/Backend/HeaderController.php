<?php

namespace App\Http\Controllers\Backend;

use App\Models\Header;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\UpdateHeaderRequest;

class HeaderController extends Controller
{

    public function index()
    {
        $header = Header::first();
        return view('backend.header.index', compact('header'));
    }


    public function update(UpdateHeaderRequest $request)
    {
        $header = Header::first();
        $header->update($request->all());

        if ($request->hasFile('image')) {
            $header
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
