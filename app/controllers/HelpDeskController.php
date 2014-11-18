<?php

class HelpDeskController extends BaseController{
    public function indexAction() {
        return Redirect::to('/login');
    }
    public function loginAction() {
        return View::make('login');
    }
    public function loginCheckAction() {
        try {
            //try to get the user object that matches the username given
            //firstOrFail() used because the username is a unique key so this should only match one
            //and we want it to error if it doesnt match anything
            $user = User::where('username', '=', $_POST['username'])->firstOrFail();
        } catch (Exception $e) {
            //no user found, return as if a bad password was given
            return Redirect::to('/login?fail');
        }
        if($user->checkPassword($_POST['password'])){
            Session::put('authenticated', true);
            Session::put('user',$user);
            return Redirect::to('/secure/main');
        }else{
            Session::put('authenticated', false);
            return Redirect::to('/login?fail');
        }
    }
    public function mainAction() {
        return View::make('main');
    }
}