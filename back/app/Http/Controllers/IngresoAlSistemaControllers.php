<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\IngresoAlSistema;





class IngresoAlSistemaControllers extends Controller
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
$ingresoalsistema = ingresoalsistema::create([
        'ID_USUARIO' => $request->ID_USUARIO,
        'NOMBRE_USUARIO' => $request->NOMBRE_USUARIO,
        'CONTRASEÑA' => $request->NOMBRE_USUARIO
        
    ]);
    return response()->json([
        'status' => '200',
        'message' => 'Guardado con exito',
        'data' => $ingresoalsistema,
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
