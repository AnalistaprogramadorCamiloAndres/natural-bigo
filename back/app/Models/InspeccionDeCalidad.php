<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class InspeccionDeCalidad extends Model
{
    use HasFactory;

    protected $table = 'inspecciondecalidad';
    
    protected $fillable = [

        'ID_INSPECCION_DE_CALIDAD',
        'PARAMETROS_DE_CONTROL',
        'NIVEL_DE_CONFORMIDAD',
        'FECHA_DE_INSPECCION',
        'RESPONSABLE_DE_LA_INSPECCION',
        'CRITERIOS_DE_ACEPTACION',
        'APROBACION_DE_LA_INSPECCION',
        'ACCIONES_CORRECTIVAS',
        'ID_NUMERO_DE_LOTE_FK',
        'ID_EMPLEADO_FK'
    ];
    public $timstamps = false;
}
