<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class TestimonyStoreRequest extends FormRequest
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
        return [
            'star'    => 'required|max:5',
            'image'   => 'required|image|file|max:2048',
            'name'    => 'required|max:255|min:5',
            'job'     => 'required|max:255',
            'message' => 'required',
        ];
    }
}
