<?php

namespace App\Providers;

use App;
use App\Models\WebSetting;
use Illuminate\Support\Facades\Cache;
use Illuminate\Contracts\Cache\Factory;
use Illuminate\Support\ServiceProvider;

class WebSettingServiceProvider extends ServiceProvider
{
    /**
     * Register services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap services.
     *
     * @return void
     */
    public function boot(WebSetting $settings)
    {
        if (!App::runningInConsole()) {
            $settings = Cache::remember('settings', 6000, function () use ($settings) {
                return $settings->configData();
            });
            config()->set('settings', $settings);
        }
    }
}
