<?php

namespace App\Providers;

use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;
use Illuminate\Support\Facades\Gate;

class AuthServiceProvider extends ServiceProvider
{
    /**
     * The policy mappings for the application.
     *
     * @var array
     */
    protected $policies = [
        'App\Models\PostCategory' => 'App\Policies\IsAdmin',
        'App\Models\Testimony' => 'App\Policies\IsAdmin',
        'App\Models\Destination' => 'App\Policies\IsAdmin',
        'App\Models\Gallery' => 'App\Policies\IsAdmin',
        'App\Models\Contact' => 'App\Policies\IsAdmin',
        'App\Models\Booking' => 'App\Policies\IsAdmin',
    ];

    /**
     * Register any authentication / authorization services.
     *
     * @return void
     */
    public function boot()
    {
        $this->registerPolicies();

        //
    }
}
