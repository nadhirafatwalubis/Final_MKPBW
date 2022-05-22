<?php

namespace App\Http\Controllers\Backend;

use App\Models\Booking;
use Illuminate\Http\Request;
use Yajra\Datatables\Datatables;
use App\Http\Controllers\Controller;

class BookingController extends Controller
{
    public function index(Request $request)
    {
        $booking = Booking::with('destination')->select([
            'bookings.id',
            'bookings.destination_id',
            'bookings.checkin_date',
            'bookings.checkout_date',
            'bookings.name',
            'bookings.phone',
            'bookings.created_at'
        ]);

        if ($request->ajax()) {
            return Datatables::eloquent($booking)
                ->addIndexColumn()
                ->addColumn('action', function ($booking) {
                    return view('backend.datatable._actionRead', [
                        'read_url'    => route('booking.read', $booking->id),
                    ]);
                })
                ->editColumn('destination.name', function ($booking) {
                    return $booking->destination->nameLimit(4);
                })
                ->editColumn('created_at', function ($booking) {
                    return $booking->created_at->translatedFormat('d F Y');
                })
                ->rawColumns(['action', 'status'])
                ->make(true);
        }
        return view('backend.booking.index');
    }

    public function read(Booking $booking)
    {
        // $booking->update(['status' => 1]);

        $this->authorize('isAdmin', Booking::class);
        return view('backend.booking.read', compact('booking'));
    }
}
