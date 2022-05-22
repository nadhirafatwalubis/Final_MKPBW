<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class PostStoreRequest extends FormRequest
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
            'title'            => 'required|max:255|min:5',
            'slug'             => 'required|max:255|unique:posts,slug',
            'post_category_id' => 'required|exists:post_categories,id',
            'excerpt'          => 'required|min:5',
            'body'             => 'required',
            'published_at'     => 'nullable|date',
            'image'            => 'image|file|max:2048',
        ];
    }

    public function attributes()
    {
        return [
            'post_category_id' => 'Category' 
        ];
    }
}
