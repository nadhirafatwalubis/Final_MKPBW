<?php

namespace Database\Seeders;

use App\Models\Post;
use App\Models\Room;
use App\Models\User;
use App\Models\Booking;
use App\Models\Contact;
use App\Models\Testimony;
use App\Models\PostCategory;
use Database\Seeders\TagSeeder;
use Illuminate\Database\Seeder;
use Database\Seeders\RoleSeeder;
use Database\Seeders\AboutSeeder;
use Database\Seeders\HeaderSeeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Database\Seeders\TestimonySeeder;
use Database\Seeders\WelcomeMessageSeeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        DB::statement('SET FOREIGN_KEY_CHECKS=0');

        $this->call(WebSettingSeeder::class);

        // Role
        $this->call(RoleSeeder::class);

        // user
        DB::table('users')->truncate();
        User::create([
            'name'              => "Ramous Peppy",
            'username'          => "mouska",
            'slug'              => "ramous-peppy",
            'email'             => "ramouspeppy@gmail.com",
            'password'          => Hash::make("mouska"),
            'email_verified_at' => now(),
            'role_id'           => 1
        ]);

        User::factory(9)->create();

        DB::table('rooms')->truncate();
        Room::factory(10)->create();

        DB::table('bookings')->truncate();
        Booking::factory(10)->create();

        DB::table('contacts')->truncate();
        Contact::factory(10)->create();

        DB::table('media')->truncate();

        $this->call(GallerySeeder::class);

        $this->call(WelcomeSeeder::class);

        $this->call(AboutSeeder::class);

        $this->call(TestimonySeeder::class);

        $this->call(DestinationSeeder::class);

        $this->call(HeaderSeeder::class);

        DB::table('post_categories')->truncate();
        PostCategory::create([
            'title' => "Uncategorized",
            'slug'  => "uncategorized",
        ]);
        PostCategory::factory(4)->create();

        $this->call(PostSeeder::class);

        $this->call(TagSeeder::class);
    }
}
