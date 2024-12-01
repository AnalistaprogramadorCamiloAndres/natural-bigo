<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LoteDeProduccion extends Model
{
    use HasFactory;

    protected $table = 'loteDeProduccion';

    protected $fillable = [
        'ID_LOTE',
            'CANTIDAD_PRODUCIDA',
            'FECHA_DE_PRODUCCION',
            'FECHA_DE_VENCIMIENTO',
            'PROVEEDOR_DE_MATERIA_PRIMA',
            'UBICACION_DE_ALMACENAMIENTO',
            'ID_PRODUCTO_FK',
            'ID_INSPECCION_DE_CALIDAD_FK',
            'ID_ENVIO_FK'


];

    public $timestamps = false; 
}
