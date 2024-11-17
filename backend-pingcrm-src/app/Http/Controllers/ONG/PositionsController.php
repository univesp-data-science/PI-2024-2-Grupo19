<?php

namespace App\Http\Controllers\ONG;

use Inertia\Inertia;
use Inertia\Response;
use App\Http\Controllers\Controller as InertiaController;

class PositionsController extends InertiaController
{
    public function index(): Response
    {
        return Inertia::render('Positions/Index');
    }

    public function applied(): Response
    {
        return Inertia::render('Positions/Applied');
    }
}
