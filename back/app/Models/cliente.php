<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;


class cliente extends Model
{
    use HasFactory;

    protected $table = 'cliente';
    protected $primaryKey = 'ID_CLIENTE';
    protected $fillable = [
        'ID_CLIENTE',
        'NOMBRE',
        'CORREO_ELECTRONICO',
        'CEDULA_DE_CIUDADANIA',
        'DIRECCION'
        ];
        public $timestamps = false;
    }

