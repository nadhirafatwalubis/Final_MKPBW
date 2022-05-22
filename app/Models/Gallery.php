<?php

namespace App\Models;

use Illuminate\Support\Str;

use Spatie\MediaLibrary\HasMedia;
use Illuminate\Support\Facades\File;
use Illuminate\Database\Eloquent\Model;
use Cviebrock\EloquentSluggable\Sluggable;
use Spatie\MediaLibrary\InteractsWithMedia;
use CyrildeWit\EloquentViewable\Contracts\Viewable;
use CyrildeWit\EloquentViewable\InteractsWithViews;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Support\Facades\Storage;
use Spatie\MediaLibrary\MediaCollections\Models\Media;

class Gallery extends Model implements HasMedia, Viewable
{
    use HasFactory, Sluggable, InteractsWithMedia, InteractsWithViews;

    protected $guarded = ['id'];

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

    // sluggable ====================================================
    public function sluggable(): array
    {
        return [
            'slug' => [
                'source' => 'title'
            ]
        ];
    }
}
