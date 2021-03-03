<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;

class ComposerServiceProvider extends ServiceProvider
{
    /**
     * Register services.
     * @return void
     */
    public function register()
    { }

    /**
     * Bootstrap services.
     * @return void
     */

    public function boot()
    {
        // $categories = \App\Category::all(['name', 'slug']);
        // view()->share('categories',$categories); //Compartilha com todas as views
        // view()->composer(['welcome','single'],function($view) use($categories){ //Possibilidade de selecionar as views
        /* view()->composer('*', function ($view) use ($categories) {
            $view->with('categories', $categories);
        }); */

        // view()->composer('*', 'App\Http\Views\CategoryViewComposer@compose');
        view()->composer('layouts.front', 'App\Http\Views\CategoryViewComposer@compose');
    }
}
