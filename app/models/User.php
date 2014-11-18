<?php

class User extends Eloquent {
    protected $table = 'user';
    public $timestamps = false;
    public function checkPassword($clear) {
        return sha1($clear) == $this->password;
    }
    public function hashPassword($clear) {
        return sha1($clear);
    }
}
