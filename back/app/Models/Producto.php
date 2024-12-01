<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Producto extends Model
{
    use HasFactory;

    protected $table = 'producto';
    protected $primaryKey = 'ID_PRODUCTO';

    protected $fillable = [
        'ID_PRODUCTO',
        'NOMBRE_PRODUCTO',
        'DESCRIPCION',
        'PRECIO',
        'STOCK_DISPONIBLE'
    ];

    public $timestamps = false;
}
