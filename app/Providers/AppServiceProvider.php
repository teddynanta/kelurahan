<?php

namespace App\Providers;

use TCG\Voyager\Models\User;
use TCG\Voyager\Models\MenuItem;
use Illuminate\Support\Facades\Gate;
use Illuminate\Support\Facades\View;
use Illuminate\Support\ServiceProvider;
use Illuminate\Http\Request;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        Gate::define('superadmin', function (User $user) {
            return $user->role_id === 1;
        });
    }
}
