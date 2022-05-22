<?php

namespace App\Models;

use Illuminate\Support\Str;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Contact extends Model
{
    use HasFactory;
    protected $guarded = ['id'];
    public function nameLimit($limit = 5)
    {
        return Str::words($this->name, $limit, '...');
    }

    public function subjectLimit($limit = 5)
    {
        return Str::words($this->subject, $limit, '...');
    }

    public function getStatusAttribute($value)
    {
        if ($value == '1') {
            return 'read';
        } elseif ($value == '0') {
            return 'unread';
        } else {
            return null;
        }
    }

    public function statusLabel()
    {
        if ($this->status == 'read') {
            return "<span class='badge badge-pill badge-success'>read</span>";
        }
        return "<span class='badge badge-pill badge-info text-white'>unread</span>";
    }
}
