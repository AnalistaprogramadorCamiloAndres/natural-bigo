<?php


namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Cliente; // Asegúrate de importar el modelo Cliente
use Illuminate\Http\Request;

class ClienteController extends Controller

{
    public function getData(Request $request)
    {
        $clientes = Cliente::all();

        return response()->json([
            'status' => '200',
            'message' => 'Lista de clientes obtenida con éxito',
            'data' => $clientes
        ]);
    }
    /**    /**
     ** Store a newly created resource in storage.
     */
    public function save(Request $request)
    {

        // Crear un nuevo cliente con los datos del formulario
        $cliente = cliente::create([
            'NOMBRE' => $request->NOMBRE,
            'CORREO_ELECTRONICO' => $request->CORREO_ELECTRONICO,
            'CEDULA_DE_CIUDADANIA' => $request->CEDULA_DE_CIUDADANIA,
            'DIRECCION' => $request->DIRECCION
        ]);

        // Devolver la respuesta en formato JSON
        return response()->json([
            'status' => '200',
            'message' => 'Guardado con éxito',
            'data' => $cliente
        ]);
    }

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
            $Producto = Cliente::where('ID_CLIENTE', $id)->first();

            if ($Producto) {
                $Producto->delete();
                return response()->json([
                    'status' => '200',
                    'message' => 'Cliente eliminado con éxito',
                ]);
            }

            return response()->json([
                'status' => '404',
                'message' => 'Ciente no encontrado',
            ], 404);
        } catch (\Exception $e) {
            return response()->json([
                'status' => '500',
                'message' => 'Ocurrió un error al eliminar el cliente',
                'error' => $e->getMessage(),
            ], 500);
        }
    }
}
