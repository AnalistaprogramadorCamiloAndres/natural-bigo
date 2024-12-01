<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Facturacion extends Model
{
    use HasFactory;

    protected $table = 'facturacion';
    protected $primaryKey = 'ID_FACTURA';

    protected $fillable = [    
        'ID_FACTURA',
        'CANTIDAD',
        'FACTURA_FECHA',
        'TOTAL_DE_LA_FACTURA',
        'METODO_DE_PAGO',
        'ID_PRODUCTO',
        'ID_CLIENTE'
    ];

    public $timestamps = false;

    /**
     * Relación con la tabla de clientes.
     */
    public function cliente()
    {
        return $this->belongsTo(Cliente::class, 'ID_CLIENTE', 'ID_CLIENTE'); 
    }

    /**
     * Relación con la tabla de productos.
     */
    public function producto()
    {
        return $this->belongsTo(Producto::class, 'ID_PRODUCTO', 'ID_PRODUCTO');
    }
}
