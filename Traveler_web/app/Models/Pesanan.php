<?php

namespace App\Models;


use Illuminate\Foundation\Auth\User as Authenticatable;


class Pesanan extends Authenticatable
{
    

    protected $fillable = [
        'customer_id',
        'guides_id',
        'wisata_id',
        'tanggal',
    ];

    public function customer() {
        return $this->belongsTo('App\Models\Customer');
    }

    public function guide() {
        return $this->belongsTo('App\Models\Guide');
    }

}