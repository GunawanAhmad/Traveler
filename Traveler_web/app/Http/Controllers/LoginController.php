<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{
    function login(Request $request) {
        $credentials = $request->validate([
            'email' => 'required|email:dns',
            'password' => 'required',
            'role'
        ]);

        if(Auth::attempt($credentials)) {
            if(Auth::user()['role'] == 'admin') {
                $request->session()->regenerate();
                return redirect()->intended('/');
            } else {
                return back()->with('loginError' ,'Login failed');
            }
        }

        return back()->with('loginError' ,'Login failed');

    }


    function index() {
        return view('login');
    }

    function logout(Request $request) {
        Auth::logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();
        return redirect('/login');
    }
}
