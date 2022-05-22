<?php

namespace App\Http\Controllers\Backend;

use Carbon\Carbon;
use App\Models\Role;
use App\Models\User;
use Illuminate\Http\Request;
use Yajra\Datatables\Datatables;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rules\Password;
use Cviebrock\EloquentSluggable\Services\SlugService;

class UserController extends Controller
{
    public function index(Request $request)
    {
        $user = User::select([
            'id',
            'name',
            'slug',
            'username',
            'email',
            'created_at'
        ])->whereNotIn('id', [1]);

        if ($request->ajax()) {
            return Datatables::eloquent($user)
                ->addIndexColumn()
                ->addColumn('action', function ($user) {
                    return view('backend.datatable._actionUser', [
                        'model'         => $user,
                        'delete_url'    => route('user.destroy', $user->id),
                        'reset_url'    => route('user.reset', $user->slug),
                        'show_url'      => route('user.show', $user->id),
                    ]);
                })

                ->editColumn('created_at', function ($user) {
                    return $user->created_at->translatedFormat('d F Y');
                })
                ->rawColumns(['action'])
                ->make(true);
        }
        return view('backend.user.index');
    }

    public function create(User $user)
    {
        // $this->authorize('isAdmin', User::class);
        $roles = Role::all();
        return view('backend.user.create', compact('user', 'roles'));
    }

    public function store(Request $request)
    {
        // $this->authorize('isAdmin', User::class);

        $request->validate([
            'name'     => 'required',
            'slug'     => 'required',
            'username' => 'required|unique:users,username',
            'email'    => 'required|unique:users,email',
            'image'    => 'required|image:jpg,jpeg,png,svg',
            'role_id'  => 'required|exists:roles,id',
            'password' => [
                'required', 'confirmed',
                Password::min(8)
                    ->letters()
                    ->mixedCase()
                    ->numbers()
                    ->symbols()
                    ->uncompromised()
            ],

        ]);
        $user = User::create([
            'name'     => $request['name'],
            'username' => $request['username'],
            'slug'     => $request['slug'],
            'email'    => $request['email'],
            'password' => Hash::make($request['password']),
            'role_id'  => $request['role_id'],
        ]);

        $user
            ->addMedia($request->image)
            ->toMediaCollection('image');

        $request->session()->flash('flash_notification', [
            "level" => "info",
            "message" => "Data $user->name has been created successfully"
        ]);

        return redirect()->route('user.index');
    }

    public function reset(Request $request, User $user)
    {
        // $this->authorize('isAdmin', User::class);
        $newPass = 'Qwerty' . Carbon::now()->format('Y') . '!';
        $user->password = Hash::make($newPass);
        $user->save();

        $request->session()->flash('flash_notification', [
            "level" => "info",
            "message" => "Password user $user->name has been reset to <strong> $newPass</strong>"
        ]);

        return redirect()->back();
    }

    public function destroy(Request $request, $id)
    {
        $this->authorize('isAdmin', User::class);

        $user = User::findOrFail($id);

        $request->session()->flash('flash_notification', [
            "level" => "info",
            "message" => "Data $user->title has been deleted successfully"
        ]);

        $user->destroy($id);

        return redirect()->route('user.index');
    }

    public function checkSlug(Request $request)
    {
        $slug = SlugService::createSlug(User::class, 'slug', $request->slug);
        return response()->json(['slug' => $slug]);
    }

    private function uploadPath()
    {
        return storage_path('app/tmp/' . auth()->user()->id . '/user');
    }
}
