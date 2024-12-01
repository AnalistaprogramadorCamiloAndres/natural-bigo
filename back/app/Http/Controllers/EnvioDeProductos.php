<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\EnvioDeProducto;
use Illuminate\Http\Request;


class EnvioDeProductos extends Controller
{
    public function getData (Request $request){
        return response()->json([
               'status' => '200',
               'message' => 'data..'
           ]);
              }
       /**    /**
     ** Store a newly created resource in storage.
     */
public function save(Request $request)
{
    $envioDeProductos = EnvioDeProducto:: create([
        'ID_ENVIO' => $request->ID_ENVIO,
        'FECHA_DE_ENVIO' => $request->FECHA_DE_ENVIO,
        'TRANSPORTE_UTILIZADO' => $request->TRANSPORTE_UTILIZADO,
        'EMBALAJE' => $request->EMBALAJE,
        'ID_PRODUCTO_FK' => $request->ID_PRODUCTO_FK,
        'ID_EMPLEADO_FK' => $request->ID_EMPLEADO_FK

    ]);
    return response()->json([
        'status' => '200',
        'message' => 'Guardado con exito',
    ]);
}

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request)
    {
        return response() -> json([
            'status' => '200',
           'message' => 'Actualizado con exito',
        ]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function delete(request $request)
    {
        return response() -> json([
            'status' => '200',
           'message' => 'Eliminado con exito',
        ]);
    }
}
