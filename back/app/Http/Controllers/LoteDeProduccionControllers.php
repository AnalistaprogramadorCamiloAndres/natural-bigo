<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\LoteDeProduccion;


class LoteDeProduccionControllers extends Controller
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
    $loteDeProduccion = loteDeProduccion::create(
        [
            'ID_LOTE' => $request->ID_LOTE,
            'CANTIDAD_PRODUCIDA' => $request->CANTIDAD_PRODUCIDA,
            'FECHA_DE_PRODUCCION' => $request->FECHA_DE_PRODUCCION,
            'FECHA_DE_VENCIMIENTO' => $request->FECHA_DE_VENCIMIENTO,
            'PROVEEDOR_DE_MATERIA_PRIMA' => $request->PROVEEDOR_DE_MATERIA_PRIMA,
            'UBICACION_DE_ALMACENAMIENTO' => $request->UBICACION_DE_ALMACENAMIENTO,
            'ID_PRODUCTO_FK' => $request->ID_PRODUCTO_FK,
            'ID_INSPECCION_DE_CALIDAD_FK' => $request->ID_INSPECCION_DE_CALIDAD_FK,
            'ID_ENVIO_FK'=> $request->ID_ENVIO_FK
        ]);
        
    return response()->json([
        'status' => '200',
        'message' => 'Guardado con exito',
        'data' => $loteDeProduccion,
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
