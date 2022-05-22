<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Support\Str;
use Database\Factories\PostFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Storage;
use Cviebrock\EloquentSluggable\Sluggable;
use Illuminate\Database\Eloquent\SoftDeletes;
use CyrildeWit\EloquentViewable\Contracts\Viewable;
use CyrildeWit\EloquentViewable\InteractsWithViews;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;
use Spatie\MediaLibrary\MediaCollections\Models\Media;

class Post extends Model implements Viewable, HasMedia
{
    use HasFactory, Sluggable, InteractsWithViews, InteractsWithMedia, SoftDeletes;

    protected $removeViewsOnDelete = true;
    protected $dates = ['published_at', 'updated_at', 'created_at'];
    protected $guarded = ['id'];

    public function registerMediaCollections(): void
    {
        $this
            ->addMediaCollection('image')
            ->singleFile();
    }

    public function registerMediaConversions(Media $media = null): void
    {
        $this->addMediaConversion('thumb')
            ->width(368)
            ->sharpen(10);
    }

    public function getImageUrlAttribute($value)
    {
        return $this->getFirstMediaUrl('image');
    }
    public function getImageThumbUrlAttribute($value)
    {
        return $this->getFirstMediaUrl('image', 'thumb');
    }

    // Relationship=========================
    public function author()
    {
        return $this->belongsTo(User::class);
    }

    public function post_category()
    {
        return $this->belongsTo(PostCategory::class);
    }

    public function tags()
    {
        return $this->belongsToMany(Tag::class);
    }

    // Main Function =======================
    public static function archives()
    {
        return static::selectRaw('count(id) as post_count, year(published_at) year, monthname(published_at) month')
            ->published()
            ->groupBy('year', 'month')
            ->orderByRaw('min(published_at) desc')
            ->get();
    }

    public function createTags($tagString)
    {
        $tagIds = [];
        foreach ($tagString as $tag) {
            $newTag = Tag::firstOrCreate(
                ['slug' =>  Str::slug($tag)],
                ['name' => trim($tag)]
            );
            $tagIds[] = $newTag->id;
        }
        $this->tags()->sync($tagIds);;
    }

    // Scope ==============================
    public function scopePublished($query)
    {
        return $query->where("published_at", "<=", Carbon::now());
    }

    public function scopeScheduled($query)
    {
        return $query->where("published_at", ">", Carbon::now());
    }

    public function scopeDraft($query)
    {
        return $query->whereNull("published_at");
    }

    public function scopeFilter($query, array $filters)
    {
        // s = search, m = month, y = year

        $query->when($filters['s'] ?? false, function ($query, $search) {
            return $query->where(function ($query) use ($search) {
                $query->where('title', 'like', '%' . $search . '%')
                    ->orWhere('excerpt', 'like', '%' . $search . '%')
                    ->orWhere('body', 'like', '%' . $search . '%');
            });
        });

        $query->when($filters['m'] ?? false, function ($query, $search) {
            return $query->where(function ($query) use ($search) {
                $query->whereRaw('month(published_at) = ?', [Carbon::parse($search)->month]);
            });
        });

        $query->when($filters['y'] ?? false, function ($query, $search) {
            return $query->where(function ($query) use ($search) {
                $query->whereRaw('year(published_at) = ?', [$search]);
            });
        });
    }

    // Assessor and Mutator==============
    public function titleLimit($limit = 5)
    {
        return Str::words($this->title, $limit);
    }

    public function excerptLimit($limit = 12)
    {
        return Str::words($this->excerpt, $limit);
    }

    public function getTagsHtmlAttribute()
    {
        $anchors = [];
        foreach ($this->tags as $tag) {
            $anchors[] = '<a href="' . route('tag', $tag->slug) . '"> ' . $tag->name . '</a>';
        }
        return implode(",", $anchors);
    }

    public function getDateAttribute()
    {

        return is_null($this->published_at) ? "" : $this->published_at->diffForHumans();
    }

    public function dateFormatted($showtimes = false)
    {
        $format = "d-m-Y";
        if ($showtimes) $format = $format . " H:i:s";
        return $this->created_at->format($format);
    }

    public function publicationLabel()
    {
        if (!$this->published_at) {
            return "<span data-toggle='tooltip' title='{$this->date}' class='badge badge-warning'>Draft</span>";
        }
        if ($this->published_at && $this->published_at->isFuture()) {
            return "<span data-toggle='tooltip' title='{$this->date}' class='badge badge-info'>Scheduled</span>";
        }
        return "<span data-toggle='tooltip' title='{$this->date}' class='badge badge-success'>Published</span>";
    }

    public function dateStatus()
    {
        return  "<span> {$this->dateFormatted()} | {$this->publicationLabel()}</span>";
    }

    public function sluggable(): array
    {
        return [
            'slug' => [
                'source' => 'title'
            ]
        ];
    }
}
