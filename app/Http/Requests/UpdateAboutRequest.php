<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UpdateAboutRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        if (request('contact') == true) {
            return [
                'video'        => 'nullable|url|max:255',
                'address'      => 'required|max:255',
                'address_url'  => 'nullable|url|max:255',
                'phone'        => 'required|max:255',
                'wa'           => 'required|max:255',
                'email'        => 'required|email|max:255',
                'fb'           => 'nullable|url|max:255',
                'ig'           => 'nullable|url|max:255',
                'yt'           => 'nullable|url|max:255',
                'tw'           => 'nullable|url|max:255',
            ];
        }

        return [
            'title'        => 'required|max:255|min:5',
            'desc'         => 'required',
            'image'        => 'image|file|max:2048',
            'image_header' => 'image|file|max:2048',
        ];
    }
}
