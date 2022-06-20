<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class requestTourGuide extends Model
{
    use HasFactory;
    protected $table = 'requestTourGuide';
    protected $fillable = [
        'guides_id',
        'wisatas_id',
        'status'
    ];

    public function guide() {
        return $this->belongsTo('App\Models\Guide');
    }

    public function wisata() {
        return $this->belongsTo('App\Models\DaftarWisata');
    }
}