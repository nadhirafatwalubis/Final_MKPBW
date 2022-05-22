<?php

namespace App\Models;

use Spatie\MediaLibrary\HasMedia;
use Illuminate\Database\Eloquent\Model;
use Spatie\MediaLibrary\InteractsWithMedia;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use CyrildeWit\EloquentViewable\Contracts\Viewable;
use CyrildeWit\EloquentViewable\InteractsWithViews;

class About extends Model implements HasMedia, Viewable
{
    use HasFactory, InteractsWithMedia, InteractsWithViews;
    protected $guarded = ['id'];

    public function registerMediaCollections(): void
    {
        $this
            ->addMediaCollection('image')
            ->singleFile();
        $this
            ->addMediaCollection('image_header')
            ->singleFile();
    }

    public function getImageUrlAttribute($value)
    {
        return $this->getFirstMediaUrl('image');
    }

    public function getImageHeaderUrlAttribute($value)
    {
        return $this->getFirstMediaUrl('image_header');
    }

    public function getWaFormattedAttribute($value)
    {
        $p =  preg_replace("~\D~", "", $this->wa);
        return preg_replace("/^0/", '62', $p, 1);
    }

    public function getPhoneFormattedAttribute($value)
    {
        $p =  preg_replace("~\D~", "", $this->phone);
        return preg_replace("/^62/", '0', $p, 1);
    }
}
