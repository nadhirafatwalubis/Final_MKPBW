<?php

namespace App\Models;

use Attribute;
use Carbon\Carbon;
use Jenssegers\Agent\Agent;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Booking extends Model
{
    use HasFactory;
    protected $dates = ['checkin_date', 'checkout_date'];

    public function destination()
    {
        return $this->belongsTo(Destination::class);
    }

    public function getCheckInDateAttribute($value)
    {
        return Carbon::parse($value)->format('d-m-Y');
    }

    public function setCheckInDateAttribute($value)
    {
        $this->attributes['checkin_date'] = Carbon::createFromFormat('d-m-Y', $value)->format('Y-m-d');
    }

    public function getCheckOutDateAttribute($value)
    {
        return Carbon::parse($value)->format('d-m-Y');
    }

    public function setCheckOutDateAttribute($value)
    {
        $this->attributes['checkout_date'] = Carbon::createFromFormat('d-m-Y', $value)->format('Y-m-d');
    }

    public function getWaFormattedAttribute($value)
    {
        $p =  preg_replace("~\D~", "", $this->phone);
        return preg_replace("/^0/", '62', $p, 1);
    }

    public function getWaUrlAttribute($value)
    {
        $walink = 'https://web.whatsapp.com/send';

        $agent = new Agent();
        if ($agent->isMobile()) {
            $walink = 'whatsapp://send';
        }

        $wa = trim($this->wa_formatted);
        $url = $walink . '?phone=' . $wa;

        return $url;
    }
}
