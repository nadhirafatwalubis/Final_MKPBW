<?php

namespace App\Policies;

use App\Models\Post;
use App\Models\Role;
use App\Models\User;
use Illuminate\Auth\Access\HandlesAuthorization;

class PostPolicy
{
    use HandlesAuthorization;

    public function checkUser(User $user, Post $post)
    {
        return in_array($user->role_id, [Role::IS_ADMIN,Role::IS_EDITOR]) || (auth()->check() && $post->author_id == auth()->id());
    }
}
