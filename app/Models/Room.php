<?php

namespace App\Models;

use Illuminate\Support\Str;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Storage;
use CyrildeWit\EloquentViewable\Contracts\Viewable;
use CyrildeWit\EloquentViewable\InteractsWithViews;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Room extends Model implements Viewable
{
    use HasFactory, InteractsWithViews;

    protected $guarded = [];

    public function booking()
    {
        return $this->belongsTo(Booking::class);
    }
    
    public function nameLimit($limit = 5)
    {
        return Str::words($this->name, $limit);
    }

    public function getPriceFormatedAttribute()
    {
        return number_format($this->price);
    }

    public function getImageUrlAttribute($value)
    {
        $imageUrl = asset("images/no-image.png");
        if (! is_null($this->image)) {
            if (Storage::exists($this->image)) $imageUrl = asset("storage/". $this->image); 
        }
        return $imageUrl;
    }

    public function getImageThumbUrlAttribute($value)
    {
        $imageUrl = asset("images/no-image.png");
        if (! is_null($this->image)) {
            $ext =  substr(strchr($this->image, '.'),1);
            $thumbnail = str_replace(".{$ext}", "-thumb.{$ext}", $this->image);
            if(Storage::exists($thumbnail)) $imageUrl = asset("storage/". $thumbnail);
        }
        return $imageUrl;
    }
}
