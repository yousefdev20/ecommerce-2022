@extends('layouts.app')

@section('content')
    <div class="text-center">
        <img src="{{url('images/logo/IRON_BRIDGE_LOGO.png')}}" width="75px" height="75px" alt="Iron Bridge">
        <h5>
            Hi {{ $order?->user?->first_name ?? '' }},
        </h5>
        <h5>[Order #{{ $order->id }}] ({{ date('D-m-Y') }})</h5>
        <h5>
            We have finished processing your order.
        </h5>
    </div>
@endsection
