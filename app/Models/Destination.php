<?php

namespace App\Models;

use Illuminate\Support\Str;

use Spatie\MediaLibrary\HasMedia;
use Illuminate\Database\Eloquent\Model;
use Spatie\MediaLibrary\InteractsWithMedia;
use CyrildeWit\EloquentViewable\Contracts\Viewable;
use CyrildeWit\EloquentViewable\InteractsWithViews;
use Cviebrock\EloquentSluggable\Sluggable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Spatie\MediaLibrary\MediaCollections\Models\Media;

class Destination extends Model implements HasMedia, Viewable
{
    use HasFactory, Sluggable, InteractsWithMedia, InteractsWithViews;

    protected $guarded = ['id'];

    public function booking()
    {
        return $this->hasMany(Booking::class);
    }
    // public function images()
    // {
    //     return $this->morphMany(Media::class, 'model');
    // }

    public function nameLimit($limit = 5)
    {
        return Str::words($this->name, $limit);
    }
    public function getDescMetaAttribute()
    {
        return trim(Str::limit(strip_tags($this->desc), 155));
    }
    public function getPriceFormatedAttribute()
    {
        return number_format($this->price);
    }

    public function registerMediaCollections(): void
    {
        $this
            ->addMediaCollection('cover')
            ->singleFile();
    }

    public function registerMediaConversions(Media $media = null): void
    {
        $this->addMediaConversion('thumb')
            ->width(368)
            ->sharpen(10)
            ->nonQueued();
    }

    public function getCoverUrlAttribute($value)
    {
        return $this->getFirstMediaUrl('cover');
    }
    public function getImagesAttribute($value)
    {
        return $this->getMedia('images');
    }
    public function getCoverThumbUrlAttribute($value)
    {
        return $this->getFirstMediaUrl('cover', 'thumb');
    }

    // Mutator ======================================================
    public function setPriceAttribute($value)
    {
        return $this->attributes['price'] = str_replace('.', '', $value);
    }

    // sluggable ====================================================
    public function sluggable(): array
    {
        return [
            'slug' => [
                'source' => 'name'
            ]
        ];
    }
}
