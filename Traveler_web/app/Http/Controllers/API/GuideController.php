<?php

namespace App\Http\Controllers\API;

use Exception;
use Illuminate\Http\Request;
use App\Helpers\ResponseFormatter;
use App\Http\Controllers\Controller;
use App\Models\Guide;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;


class GuideController extends Controller
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
                return ResponseFormatter::error([
                    'message' => $validator->errors()->first(),
                    'error' => "Something went wrong",
                ],$validator->errors()->first() , 500);
            }
            $credentials = request(['email', 'password']);
            if (Auth::guard('guide')->attempt($credentials)) {
                $user = Auth::guard('guide')->user();
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
                'email' => ['required', 'string', 'email', 'max:255', 'unique:guides'],
                'password' => ['required', 'min:3'],
                'alamat' => ['required', 'max:255'],
            ]);

            if ($validator->fails()) {
                return ResponseFormatter::error([
                    'message' => $validator->errors()->first(),
                    'error' => $validator->errors()->first(),
                ],$validator->errors()->first() , 500);
            }

            Log::info($request);

            $user = Guide::create($request->all());
            $user->update(['password' => Hash::make($request->password)]);
            if ($request->hasFile('foto')) {
                $fotoName = $request->file('foto')->hashName();
                $request->file('foto')->store('public/images');
                $user->update(['foto' => $fotoName]);
            }

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