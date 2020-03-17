<?php

namespace Hele2020;

use Illuminate\Support\ServiceProvider;

class StringsI18NProvider extends ServiceProvider
{
    public function boot()
    {
        $this->loadTranslationsFrom(__DIR__.'/../lang', 'hele');
    }

    public function register()
    {
    }
}
