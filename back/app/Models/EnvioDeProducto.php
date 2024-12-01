<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class EnvioDeProducto extends Model
{
    use HasFactory;

    protected $fillable = [
        'ID_ENVIO',
        'FECHA_DE_ENVIO',
        'TRANSPORTE_UTILIZADO',
        'EMBALAJE',
        'ID_PRODUCTO_FK',
        'ID_EMPLEADO_FK'
    ];

    public $timstamps = false;
}
