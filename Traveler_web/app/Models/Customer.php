<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class Customer extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    protected $fillable = [
        'nama',
        'email',
        'password',
        'ttl',
        'alamat',
        'foto',
        'no_hp'
    ];

    public function pesanan() {
        return $this->hasMany('App\Models\Pesanan');
    }

    public function age() {
        return Carbon::parse($this->attributes['ttl'])->age;
    }
}