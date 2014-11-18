<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the Closure to execute when that URI is requested.
|
*/

Route::get('/', 'HelpDeskController@indexAction');
Route::get('/login', 'HelpDeskController@loginAction');
Route::post('/login', 'HelpDeskController@loginCheckAction');
Route::get('/secure/main', 'HelpDeskController@mainAction');