<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Producto;

class ProductoControllers extends Controller
{
    public function getData(Request $request)
    {
        $productos = producto::all();

        // Retorna una respuesta JSON con los datos obtenidos
        return response()->json([
            'status' => '200',
            'message' => 'Lista de productos obtenida con éxito',
            'data' => $productos
        ]);
    }
    /**    /**
     ** Store a newly created resource in storage.
     */
    public function save(Request $request)
    {
        $producto = producto::create([
            'ID_PRODUCTO' => $request->ID_PRODUCTO,
            'NOMBRE_PRODUCTO' => $request->NOMBRE_PRODUCTO,
            'DESCRIPCION' => $request->DESCRIPCION,
            'PRECIO' => $request->PRECIO,
            'STOCK_DISPONIBLE' => $request->STOCK_DISPONIBLE
        ]);
        return response()->json([
            'status' => '200',
            'message' => 'Guardado con exito',
            'data' => $producto
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
            $data = Producto::where('ID_PRODUCTO', $id)->first();
    
            if ($data) {
                $data->delete();
                return response()->json([
                    'status' => '200',
                    'message' => 'Producto eliminado con éxito',
                ]);
            }
    
            return response()->json([
                'status' => '404',
                'message' => 'Producto no encontrado',
            ], 404);
        } catch (\Exception $e) {
            return response()->json([
                'status' => '500',
                'message' => 'Ocurrió un error al eliminar el producto',
                'error' => $e->getMessage(),
            ], 500);
        }
    }
}
