<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\InspeccionDeCalidad;

class InspeccionDeCalidadControllers extends Controller
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
    $inspeccionDeCalidad = inspecciondecalidad::create([
        'ID_INSPECCION_DE_CALIDAD' => $request->ID_INSPECCION_DE_CALIDAD,
        'PARAMETROS_DE_CONTROL' => $request->PARAMETROS_DE_CONTROL,
        'NIVEL_DE_CONFORMIDAD' => $request->NIVEL_DE_CONFORMIDAD,
        'FECHA_DE_INSPECCION' => $request->FECHA_DE_INSPECCION,
        'RESPONSABLE_DE_LA_INSPECCION' => $request->RESPONSABLE_DE_LA_INSPECCION,
        'CRITERIOS_DE_ACEPTACION' => $request->CRITERIOS_DE_ACEPTACION,
        'APROBACION_DE_LA_INSPECCION' => $request->APROBACION_DE_LA_INSPECCION,
        'ACCIONES_CORRECTIVAS' => $request->ACCIONES_CORRECTIVAS,
        'ID_NUMERO_DE_LOTE_FK' => $request->ID_NUMERO_DE_LOTE_FK,
        'ID_EMPLEADO_FK' => $request->ID_EMPLEADO_FK

    ]);
    
    return response()->json([
        'status' => '200',
        'message' => 'Guardado con exito',
        'data' => $inspeccionDeCalidad,
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
