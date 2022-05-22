<?php

namespace App\Policies;

use App\Models\Role;
use App\Models\User;
use Illuminate\Auth\Access\Response;
use Illuminate\Auth\Access\HandlesAuthorization;

class IsAdmin
{
    use HandlesAuthorization;

    public function isAdmin(User $user)
    {
        return in_array($user->role_id, [Role::IS_ADMIN, Role::IS_EDITOR]);
    }
}
