<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class IngresoAlSistema extends Model
{
    use HasFactory;
    protected $table = 'ingresoalsistema';

    protected $fillable = [
        'ID_USUARIO',
        'NOMBRE_USUARIO',
        'CONTRASEÑA' 
    ];
    
    public $timstamps = false;
}
