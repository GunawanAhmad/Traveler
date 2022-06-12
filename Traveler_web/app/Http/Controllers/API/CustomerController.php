<?php

namespace App\Http\Controllers\API;

use Exception;
use App\Models\User;;
use Illuminate\Http\Request;
use App\Helpers\ResponseFormatter;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;


class CustomerController extends Controller
{
    public function login(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                // Validasi input
                'email' => 'required|email',
                'password' => 'required'
            ]);

            if ($validator->fails()) {
                return response()->json($validator->errors(), 400);
            }
            $credentials = request(['email', 'password']);
            if (Auth::attempt($credentials)) {
                $user = Auth::user();
                if (!Hash::check($request->password, $user->password, [])) {
                    throw new \Exception('Invalid Credentials');
                }
                
                /** @var \App\Models\MyUserModel $user **/
                $tokenResult = $user->createToken('authToken')->plainTextToken;
                return ResponseFormatter::success([
                    'token' => $tokenResult,
                    'token_type' => 'Bearer',
                    'user' => $user
                ],'Authenticated');
                
            } else {
                return ResponseFormatter::error([
                    'message' => 'Unauthorized'
                ],'Authentication Failed', 500);
            }

            
        } catch (Exception $error) {
            return ResponseFormatter::error([
                'message' => 'Something went wrong',
                'error' => $error,
            ],'Authentication Failed', 500);
        
        }
    }

    public function register(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'name' => ['required', 'string', 'max:255'],
                'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
                'password' => ['required', 'min:3'],
                'alamat' => ['required', 'max:255']
            ]);

            if ($validator->fails()) {
                return response()->json($validator->errors(), 400);
            }

            $user = User::create([
                'name' => $request->name,
                'email' => $request->email,
                'alamat' => $request->alamat,
                'password' => Hash::make($request->password),
                'role' => 'customer'
            ]);

            $token = $user->createToken('authToken')->plainTextToken;
            return ResponseFormatter::success([
                'token' => $token,
                'token_type' => 'Bearer',
                'user' => $user
            ]);
        } catch (Exception $error) {
            return ResponseFormatter::error([
                'message' => 'Something Went Wrong',
                'error' => $error
            ], 'Authentication Failed', 500);
        }
    }
}