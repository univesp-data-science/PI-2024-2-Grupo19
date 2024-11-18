<?php

namespace App\Http\Controllers\ONG;

use Inertia\Inertia;
use Inertia\Response;
use App\Http\Controllers\Controller as InertiaController;

use App\Models\ONG\Positions;
use Illuminate\Http\RedirectResponse;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Request;

class PositionsController extends InertiaController
{
    public function index(): Response
    {
        return Inertia::render('Positions/Index', [
            'filters' => Request::all('search', 'trashed'),
            'positions' => Auth::user()->account->positions()
                ->orderByName()
                ->filter(Request::only('search', 'trashed'))
                ->get()
        ]);
    }

    public function select(): Response
    {
        return Inertia::render('Positions/SelectVolunteers');
    }

    public function applied(): Response
    {
        $data = [
            'filters' => Request::all('search', 'trashed'),
            'positions' => Positions::orderByName()
                ->where('id', 1)
                ->filter(Request::only('search', 'trashed'))
                ->get()
        ];
        
        return Inertia::render('Positions/Applied', $data);
    }

    public function create(): Response
    {
        return Inertia::render('Positions/Create');
    }

    public function edit(): Response
    {
        return Inertia::render('Positions/Edit');
    }

    public function store(): RedirectResponse
    {
        Auth::user()->account->positions()->create(
            Request::validate([
                'name' => ['required', 'max:100'],
                'date_from' => ['required', 'date'],
                'date_to' => ['required', 'date'],
                'meta_data' => ['required', 'json'],
            ])
        );

        return Redirect::route('positions')->with('success', 'Organization created.');
    }
}
