<?php

namespace Database\Seeders;

use App\Models\WebSetting;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class WebSettingSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('web_settings')->truncate();
        $data = array(
            [
                'name'  => 'site_name',
                'value' => 'Site Name',
            ],
            [
                'name'  => 'site_title',
                'value' => 'Most awesome website in the world',
            ],
            [
                'name'  => 'site_desc',
                'value' => 'Congratulation,you have found the most awesome website in the world',
            ],

            [
                'name'  => 'site_logo',
                'value' => 'data/setting/logo.png',
            ],
            [
                'name'  => 'favicon',
                'value' => 'images/data/setting/favicon.ico',
            ],
            [
                'name'  => 'g_verif',
                'value' => '',
            ],
            [
                'name'  => 'g_tag',
                'value' => '',
            ],
            [
                'name'  => 'script',
                'value' => '',
            ],
            [
                'name'  => 'og_image',
                'value' => 'og-image.jpg',
            ],
            [
                'name'  => 'bg_footer',
                'value' => 'data/setting/footer.jpg',
            ],
            [
                'name'  => 'bg_header_other',
                'value' => 'data/header/image-other.jpg',
            ],
            [
                'name'  => 'bg_testimony',
                'value' => 'data/testimony/bg.jpg',
            ],
        );

        return WebSetting::insert($data);
    }
}
