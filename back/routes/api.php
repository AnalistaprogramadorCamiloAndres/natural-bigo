<?php

use App\Http\Controllers\AuthController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ClienteController;
use App\Http\Controllers\EnvioDeProductos;
use App\Http\Controllers\EmpleadoControllers;
use App\Http\Controllers\FacturacionControllers;
use App\Http\Controllers\IngresoAlSistemaControllers;
use App\Http\Controllers\InspeccionDeCalidadControllers;
use App\Http\Controllers\LoteDeProduccionControllers;
use App\Http\Controllers\ProductoControllers;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('/api/login', [AuthController::class, 'login']);


// Route to register a new user 
 // Assuming ClienteController is in the App\Http\Controllers namespace
Route::get('/api/cliente/', [ClienteController::class, 'getData']);
Route::put('/api/cliente/', [ClienteController::class, 'update']);
Route::post('/api/cliente/', [ClienteController::class, 'save']);
Route::delete('/api/cliente/{id}', [ClienteController::class, 'delete']);

Route::get('/api/empleado/', [EmpleadoControllers::class, 'getData']);
Route::put('/api/empleado/', [EmpleadoControllers::class, 'update']);
Route::post('/api/empleado/', [EmpleadoControllers::class, 'save']);
Route::delete('/api/empleado/{id}', [EmpleadoControllers::class, 'delete']);

Route::get('/api/enviodeproductos/', [EnvioDeProductos::class, 'getData']);
Route::put('/api/enviodeproductos/', [EnvioDeProductos::class, 'update']);
Route::post('/api/enviodeproductos/', [EnvioDeProductos::class, 'save']);
Route::delete('/api/enviodeproductos/', [EnvioDeProductos::class, 'delete']);

Route::get('/api/facturacion/', [FacturacionControllers::class, 'getData']);
Route::put('/api/facturacion/', [FacturacionControllers::class, 'update']);
Route::post('/api/facturacion/', [FacturacionControllers::class, 'save']);
Route::delete('/api/facturacion/{id}', [FacturacionControllers::class, 'delete']);

Route::get('/api/ingresoalsistema/', [IngresoAlSistemaControllers::class, 'getData']);
Route::put('/api/ingresoalsistema/', [IngresoAlSistemaControllers::class, 'update']);
Route::post('/api/ingresoalsistema/', [IngresoAlSistemaControllers::class, 'save']);
Route::delete('/api/ingresoalsistema/', [IngresoAlSistemaControllers::class, 'delete']);

Route::get('/api/inspecciondecalidad/', [InspeccionDeCalidadControllers::class, 'getData']);
Route::put('/api/inspecciondecalidad/', [InspeccionDeCalidadControllers::class, 'update']);
Route::post('/api/inspecciondecalidad/', [InspeccionDeCalidadControllers::class, 'save']);
Route::delete('/api/inspecciondecalidad/', [InspeccionDeCalidadControllers::class, 'delete']);

Route::get('/api/lotedeproduccion/', [LoteDeProduccionControllers::class, 'getData']);
Route::put('/api/lotedeproduccion/', [LoteDeProduccionControllers::class, 'update']);
Route::post('/api/lotedeproduccion/', [LoteDeProduccionControllers::class, 'save']);
Route::delete('/api/lotedeproduccion/', [LoteDeProduccionControllers::class, 'delete']);

Route::get('/api/producto/', [ProductoControllers::class, 'getData']);
Route::put('/api/producto/', [ProductoControllers::class, 'update']);
Route::post('/api/producto/', [ProductoControllers::class, 'save']);
Route::delete('/api/producto/{id}', [ProductoControllers::class, 'delete']);