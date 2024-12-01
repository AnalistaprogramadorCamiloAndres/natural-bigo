<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Facturacion;


class FacturacionControllers extends Controller
{
    public function getData(Request $request)
    {
        $data = Facturacion::with(['cliente', 'producto'])->get();

        return response()->json([
            'status' => '200',
            'message' => 'Lista de facturas obtenida con éxito',
            'data' => $data
        ]);
    }

    /**    /**
     ** Store a newly created resource in storage.
     */
    public function save(Request $request)
    {
        $facturacion = facturacion::create([

            'ID_FACTURA' => $request->ID_FACTURA,
            'FACTURA_FECHA' => $request->FACTURA_FECHA,
            'CANTIDAD' => $request->CANTIDAD,
            'TOTAL_DE_LA_FACTURA' => $request->TOTAL_DE_LA_FACTURA,
            'METODO_DE_PAGO' => $request->METODO_DE_PAGO,
            'ID_PRODUCTO' => $request->ID_PRODUCTO,
            'ID_CLIENTE' => $request->ID_CLIENTE


        ]);
        return response()->json([
            'status' => '200',
            'message' => 'Guardado con exito',
            'data' => $facturacion,
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request)
    {
        return response()->json([
            'status' => '200',
            'message' => 'Actualizado con exito',
        ]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function delete($id)
    {
        try {
            $facturacion = Facturacion::where('ID_FACTURA', $id)->first();
    
            if ($facturacion) {
                $facturacion->delete();
                return response()->json([
                    'status' => '200',
                    'message' => 'Factura eliminada con éxito',
                ]);
            }
    
            return response()->json([
                'status' => '404',
                'message' => 'Factura no encontrada',
            ], 404);
        } catch (\Exception $e) {
            return response()->json([
                'status' => '500',
                'message' => 'Ocurrió un error al eliminar la factura',
                'error' => $e->getMessage(),
            ], 500);
        }
    }    
}
