<?php

namespace App\Http\Controllers\Backend;

use App\Models\WebSetting;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Cache;

class WebSettingController extends Controller
{

    protected $uploadPath;
    public function __construct()
    {
        $this->uploadPath = public_path(config('myblog.uploadPath.setting'));
    }
    public function getSettings()
    {
        return  new WebSetting();
    }
    public function website()
    {
        $website    = $this->getSettings();
        return view("backend.websetting.website", compact('website'));
    }

    public function update(Request $request)
    {
        // return $request->all();
        $webSetting = $this->getSettings();

        if ($request->input('website') == true) {
            $this->websiteValidation($request);
        }
        if ($request->input('header') == true) {
            $this->headerValidation($request);
        }
        if ($request->input('testimony') == true) {
            $this->testimonyValidation($request);
        }
        // if ($request->hasFile('favicon')) {
        //     $favicon = $this->getSettings()->findValue('favicon');
        //     // remove favicon
        //     $this->removeImage($favicon);

        //     // get extention
        //     $ext = Str::after($favicon, ".");

        //     // loop any size
        //     foreach ($this->widthSize as $value) {
        //         // remove the other favicon
        //         $this->removeImage("favicon-{$value}x{$value}.{$ext}");
        //     }
        // }

        $data = $this->handleRequest($request);

        foreach ($data as $name => $value) {
            if (!empty($name)) {
                $webSetting->updateValue($name, $value);
            }
        }

        Cache::forget('settings');

        $request->session()->flash('flash_notification', [
            "level" => "info",
            "message" => "Your settings has been saved !!"
        ]);

        return redirect()->back();
    }

    private function websiteValidation($request)
    {
        $request->validate([
            'site_name'       => 'required|max:100',
            'site_title'      => 'required',
            'site_desc'       => 'required',
            'site_logo'       => 'mimes:jpg,jpeg,png,gif|max:500',
            'favicon'         => 'mimes:jpg,jpeg,ico,png|max:250',
            'og_image'        => 'mimes:jpg,jpeg,ico,png|max:500',
            'g_verif'         => 'nullable|min:5',
            'g_tag'           => 'nullable|min:5',
            'script'          => 'nullable|min:5',
            'bg_footer'       => 'mimes:jpg,jpeg,ico,png|max:500',
        ]);
    }
    private function headerValidation($request)
    {
        $request->validate([
            'bg_header_other'        => 'mimes:jpg,jpeg,png|max:2024',
        ]);
    }
    private function testimonyValidation($request)
    {
        $request->validate([
            'bg_testimony'        => 'mimes:jpg,jpeg,png|max:2024',
        ]);
    }
    private function handleRequest($request)
    {
        $data = $request->all();
        if ($request->hasFile('site_logo')) {
            $site_logo   = $request->file('site_logo');
            $extension   = $site_logo->getClientOriginalExtension();
            $filename    = 'logo.' . $extension;
            $destination = $this->uploadPath;

            $successUploaded = $site_logo->move($destination, $filename);
            $data['site_logo']     = $filename;
        }

        if ($request->hasFile('favicon')) {
            $favicon     = $request->file('favicon');
            $extension   = $favicon->getClientOriginalExtension();
            $filename    = 'favicon.' . $extension;
            $destination = public_path();

            $successUploaded = $favicon->move($destination, $filename);
            // $size            = $this->widthSize;
            // if ($successUploaded) {
            //     foreach ($size as $value) {
            //         $name  = str_replace(".{$extension}", "-{$value}x{$value}.{$extension}", $filename);
            //         $width = $value;
            //         // fungsi widen lebih efektif dipakai dari resize
            //         // karena lebar gambar akan menyesuaikan tinggi otomatis
            //         Image::make($destination . "/" . $filename)
            //             ->widen($width)
            //             ->save($destination . "/" . $name);

            //         $data['faviconx' . $value] = $name;
            //     }
            // }
            $data['favicon'] = $filename;
        }

        if ($request->hasFile('og_image')) {
            $og_image     = $request->file('og_image');
            $extension   = $og_image->getClientOriginalExtension();
            $filename    = 'site_image.' . $extension;
            $destination = $this->uploadPath;

            $successUploaded = $og_image->move($destination, $filename);
            $data['og_image'] = $filename;
        }

        if ($request->hasFile('bg_footer')) {
            $bg_footer     = $request->file('bg_footer');
            $extension   = $bg_footer->getClientOriginalExtension();
            $filename    = 'bg_footer.' . $extension;
            $destination = $this->uploadPath;

            $successUploaded = $bg_footer->move($destination, $filename);
            $data['bg_footer'] = $filename;
        }

        if ($request->hasFile('bg_header_other')) {
            $bg_header_other     = $request->file('bg_header_other');
            $extension   = $bg_header_other->getClientOriginalExtension();
            $filename    = 'image_header_other.' . $extension;
            $destination = $this->uploadPath;

            $successUploaded = $bg_header_other->move($destination, $filename);
            $data['bg_header_other'] = $filename;
        }

        if ($request->hasFile('bg_testimony')) {
            $bg_testimony     = $request->file('bg_testimony');
            $extension   = $bg_testimony->getClientOriginalExtension();
            $filename    = 'bg_testimony.' . $extension;
            $destination = $this->uploadPath;

            $successUploaded = $bg_testimony->move($destination, $filename);
            $data['bg_testimony'] = $filename;
        }
        return $data;
    }

    public function removeImage($image)
    {
        if (!empty($image)) {
            $imagePath     = $this->uploadPath . '/' . $image;
            $ext           = substr(strrchr($image, '.'), 1);

            if (file_exists($imagePath)) unlink($imagePath);
        }
    }
}
