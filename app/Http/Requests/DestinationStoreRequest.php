<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class DestinationStoreRequest extends FormRequest
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
            'name'     => 'required|max:255|min:5',
            'slug'     => 'required|max:255|unique:destinations,slug',
            'cover'    => 'required|image|file|max:2048',
            'price'    => 'required',
            'capacity' => 'required|numeric',
            'location' => 'required|max:255',
            'facility' => 'required',
            'desc'     => 'required',
        ];
    }

    public function attributes()
    {
        return [
            'desc' => 'description'
        ];
    }
}
