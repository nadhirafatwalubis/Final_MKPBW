<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class DestinationUpdateRequest extends DestinationStoreRequest
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
        $rules = parent::rules();
        $rules['slug'] = 'required|unique:destinations,slug,' . $this->route('destination');
        $rules['cover'] = 'image|file|max:2048';
        return $rules;
    }
}
