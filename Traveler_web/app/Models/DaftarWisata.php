<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DaftarWisata extends Model
{
    use HasFactory;
    protected $fillable = ['id','nama_daerah','deskripsi', 'provinsi', 'alamat', 'foto'];
}