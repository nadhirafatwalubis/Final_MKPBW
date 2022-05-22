<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class WebSetting extends Model
{
    use HasFactory;
    protected $fillable = ['value'];
    public $timestamps = false;

    protected $uploadPath;
    public function __construct()
    {
        $this->uploadPath = config('myblog.uploadPath.setting');
    }
    public function findValue($name)
    {
        $data = $this->where('name', $name)->first();
        if (empty($data)) {
            return "data or value has not been set";
        } else {
            return $data->value;
        }
    }
    public function updateValue($name, $value)
    {
        $data = $this->where('name', $name)->update(['value' => $value]);
    }
    public function getSiteLogoUrlAttribute()
    {
        $imageUrl = asset('images/no-image.png');
        $image = trim($this->findValue('site_logo'));
        if (!is_null($image)) {
            $directory = $this->uploadPath;
            $imagePath = public_path() . "/{$directory}/" . $image;
            if (file_exists($imagePath)) $imageUrl = asset("{$directory}/" . $image);
        }
        return $imageUrl;
    }
    public function getFaviconUrlAttribute()
    {
        $imageUrl = asset('images/no-image.png');
        $image = trim($this->findValue('favicon'));
        if (!is_null($image)) {
            $imagePath = public_path() . '/' . $image;
            if (file_exists($imagePath)) $imageUrl = asset("/" . $image);
        }
        return $imageUrl;
    }
    public function getOgImageUrlAttribute()
    {
        $imageUrl = asset('images/no-image.png');
        $image = trim($this->findValue('og_image'));
        if (!is_null($image)) {
            $directory = $this->uploadPath;
            $imagePath = public_path() . "/{$directory}/" . $image;
            if (file_exists($imagePath)) $imageUrl = asset("{$directory}/" . $image);
        }
        return $imageUrl;
    }
    public function getBgFooterUrlAttribute()
    {
        $imageUrl = asset('images/no-image.png');
        $image = trim($this->findValue('bg_footer'));
        if (!is_null($image)) {
            $directory = $this->uploadPath;
            $imagePath = public_path() . "/{$directory}/" . $image;
            if (file_exists($imagePath)) $imageUrl = asset("{$directory}/" . $image);
        }
        return $imageUrl;
    }
    public function getBgHeaderOtherUrlAttribute()
    {
        $imageUrl = asset('images/no-image.png');
        $image = trim($this->findValue('bg_header_other'));
        if (!is_null($image)) {
            $directory = 'images';
            $imagePath = public_path() . "/{$directory}/" . $image;
            if (file_exists($imagePath)) $imageUrl = asset("{$directory}/" . $image);
        }
        return $imageUrl;
    }
    public function getBgTestimonyUrlAttribute()
    {
        $imageUrl = asset('images/no-image.png');
        $image = trim($this->findValue('bg_testimony'));
        if (!is_null($image)) {
            $directory = 'images';
            $imagePath = public_path() . "/{$directory}/" . $image;
            if (file_exists($imagePath)) $imageUrl = asset("{$directory}/" . $image);
        }
        return $imageUrl;
    }
    public function configData()
    {
        $data =  $this->pluck('value', 'name')->all();
        $data['site_logo_url'] = $this->site_logo_url;
        $data['favicon_url'] = $this->favicon_url;
        $data['og_image_url'] = $this->og_image_url;
        $data['bg_footer_url'] = $this->bg_footer_url;
        $data['bg_header_other_url'] = $this->bg_header_other_url;
        $data['bg_testimony_url'] = $this->bg_testimony_url;
        return $data;
    }
}
