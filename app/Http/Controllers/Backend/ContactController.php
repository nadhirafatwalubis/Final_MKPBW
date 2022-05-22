<?php

namespace App\Http\Controllers\Backend;

use App\Models\Contact;
use Illuminate\Http\Request;
use Yajra\Datatables\Datatables;
use App\Http\Controllers\Controller;

class ContactController extends Controller
{
    public function index(Request $request)
    {
        $contact = Contact::select([
            'id',
            'name',
            'email',
            'subject',
            'status',
            'created_at'
        ]);

        if ($request->ajax()) {
            return Datatables::eloquent($contact)
                ->addIndexColumn()
                ->addColumn('action', function ($contact) {
                    return view('backend.datatable._actionRead', [
                        'read_url'    => route('contact.read', $contact->id),
                    ]);
                })
                ->editColumn('name', function ($contact) {
                    return $contact->nameLimit(3);
                })
                ->editColumn('subject', function ($contact) {
                    return $contact->subjectLimit(4);
                })
                ->editColumn('status', function ($contact) {
                    return $contact->statusLabel();
                })
                ->editColumn('created_at', function ($contact) {
                    return $contact->created_at->translatedFormat('d F Y');
                })
                ->rawColumns(['action', 'status'])
                ->make(true);
        }
        return view('backend.contact.index');
    }

    public function read(Contact $contact)
    {
        $contact->update(['status' => 1]);

        $this->authorize('isAdmin', Contact::class);
        return view('backend.contact.read', compact('contact'));
    }
}
