<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class requestTourGuide extends Model
{
    use HasFactory;
    protected $table = 'requestTourGuide';
    protected $fillable = [
        'nama',
        'email',
        'password',
        'role',
        'ttl',
        'alamat',
        'foto',
        'no_hp',
        'status'
    ];
}
