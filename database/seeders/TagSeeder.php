<?php

namespace Database\Seeders;

use App\Models\Tag;
use App\Models\Post;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class TagSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('tags')->truncate();
        
        $php       = new Tag();
        $php->name = "PHP";
        $php->slug = "php";
        $php->save();

        $laravel       = new Tag();
        $laravel->name = "Laravel";
        $laravel->slug = "laravel";
        $laravel->save();
        
        $vue       = new Tag();
        $vue->name = "Vue JS";
        $vue->slug = "vue-js";
        $vue->save();

        $java       = new Tag();
        $java->name = "Java";
        $java->slug = "java";
        $java->save();

        $phyton       = new Tag();
        $phyton->name = "Phyton";
        $phyton->slug = "phyton";
        $phyton->save();
        
        $ruby       = new Tag();
        $ruby->name = "Ruby";
        $ruby->slug = "ruby";
        $ruby->save();

        $react       = new Tag();
        $react->name = "React";
        $react->slug = "react";
        $react->save();

        $tags = [
            $php->id,
            $java->id,
            $laravel->id,
            $vue->id,
            $phyton->id,
            $ruby->id,
            $react->id
        ];

        foreach (Post::all() as $post) {

            shuffle($tags);
            
            for($i = 0; $i < rand(0,count($tags)-1); $i++){
                $post->tags()->detach($tags[$i]);
                $post->tags()->attach($tags[$i]);
            }
        }
    }
}
