<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Empleado extends Model
{
    use HasFactory;
    protected $table = 'EMPLEADOS';
    protected $primaryKey = 'ID_EMPLEADO';
    protected $fillable = [
        'NOMBRES',
        'APELLIDOS',
        'CARGO',
        'TELEFONO',
        'CORREO_ELECTRONICO',
        'DIRECCION',
        "CEDULA_DE_CIUDADANIA",
        "ID_USUARIO_FK"
    ];
    public $timestamps = false;
}
