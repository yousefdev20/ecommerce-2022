@extends('layouts.app')

@section('content')
    <div role="region" tabindex="-1" aria-label="Message body"
         class="fEEQbbifEC8quzJXH0sd TiApUvaZOn0aLkSUHRf7 allowTextSelection">
        <div>
            <div class="rps_a1de">
                <div leftmargin="0" marginwidth="0" topmargin="0" marginheight="0" style="padding:0">
                    <div id="x_wrapper" dir="ltr" style="background-color:#f7f7f7; margin:0; padding:70px 0; width:100%">
                        <table border="0" cellpadding="0" cellspacing="0" height="100%" width="100%">
                            <tbody>
                            <tr>
                                <td align="center" valign="top">
                                    <div id="x_template_header_image">
                                        <p style="margin-top:0">
                                            <img data-imagetype="External"
                                                 src="{{url('images/logo/IRON_BRIDGE_LOGO.png')}}"
                                                 width="75px" height="75px" alt="Iron Bridge"
                                                 style="border:none; display:inline-block; font-size:14px; font-weight:bold; height:auto; outline:none; text-decoration:none; text-transform:capitalize; vertical-align:middle; max-width:100%; margin-left:0; margin-right:0"></p></div><table border="0" cellpadding="0" cellspacing="0" width="600" id="x_template_container" style="background-color:#ffffff; border:1px solid #dedede; border-radius:3px">
                                        <tbody>
                                        <tr>
                                            <td align="center" valign="top">
                                                <table border="0" cellpadding="0" cellspacing="0" width="100%"
                                                       id="x_template_header"
                                                       style="background:#503e91; color:#ffffff; border-bottom:0; font-weight:bold; line-height:100%; vertical-align:middle; font-family:&quot;Helvetica Neue&quot;,Helvetica,Roboto,Arial,sans-serif; border-radius:3px 3px 0 0">
                                                    <tbody>
                                                    <tr>
                                                        <td id="x_header_wrapper" style="padding:36px 48px;display:block;color:#ffffff;border-bottom:0;font-weight:bold;line-height:100%;vertical-align:middle;font-family:'Helvetica Neue,Helvetica,Roboto,Arial,sans-serif';border-radius:3px 3px 0 0;background: #503e91;">
                                                            <h1 style="font-family:&quot;Helvetica Neue&quot;,Helvetica,Roboto,Arial,sans-serif; font-size:30px; font-weight:300; line-height:150%; margin:0; text-align:left; color:#ffffff; background-color:inherit">
                                                                Thank you for your order
                                                            </h1>
                                                        </td>
                                                    </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" valign="top">
                                                <table border="0" cellpadding="0" cellspacing="0" width="600" id="x_template_body">
                                                    <tbody>
                                                    <tr>
                                                        <td valign="top" id="x_body_content" style="background-color:#ffffff">
                                                            <table border="0" cellpadding="20" cellspacing="0" width="100%">
                                                                <tbody>
                                                                <tr>
                                                                    <td valign="top" style="padding:48px 48px 32px">
                                                                        <div id="x_body_content_inner"
                                                                             style="color:#333333; font-family:&quot;Helvetica Neue&quot;,Helvetica,Roboto,Arial,sans-serif; font-size:14px; line-height:150%; text-align:left">
                                                                            <p style="margin:0 0 16px">Hi test,</p>
                                                                            <p style="margin:0 0 16px">
                                                                                Just to let you know — we've received your order #{{ $order->id }}, and it is now being processed:
                                                                            </p>
                                                                            <p style="margin:0 0 16px">Pay with cash upon delivery.</p>
                                                                            <h2 style="color:#503e91; display:block; font-family:&quot;Helvetica Neue&quot;,Helvetica,Roboto,Arial,sans-serif; font-size:18px; font-weight:bold; line-height:130%; margin:0 0 18px; text-align:left">
                                                                                [Order #{{ $order->id }}] ({{ date('M-D-Y', strtotime($order->created_at)) }})
                                                                            </h2>
                                                                            <div style="margin-bottom:40px">
                                                                                <table class="x_td" cellspacing="0" cellpadding="6" border="1" style="color:#333333; border:1px solid #e5e5e5; vertical-align:middle; width:100%; font-family:'Helvetica Neue',Helvetica,Roboto,Arial,sans-serif">
                                                                                    <thead>
                                                                                    <tr>
                                                                                        <th class="x_td" scope="col" style="color:#333333; border:1px solid #e5e5e5; vertical-align:middle; padding:12px; text-align:left">
                                                                                            Id
                                                                                        </th>
                                                                                        <th class="x_td" scope="col" style="color:#333333; border:1px solid #e5e5e5; vertical-align:middle; padding:12px; text-align:left">
                                                                                            Product
                                                                                        </th>
                                                                                        <th class="x_td" scope="col" style="color:#333333; border:1px solid #e5e5e5; vertical-align:middle; padding:12px; text-align:left">
                                                                                            Color
                                                                                        </th>
                                                                                        <th class="x_td" scope="col" style="color:#333333; border:1px solid #e5e5e5; vertical-align:middle; padding:12px; text-align:left">
                                                                                            Size
                                                                                        </th>
                                                                                        <th class="x_td" scope="col" style="color:#333333; border:1px solid #e5e5e5; vertical-align:middle; padding:12px; text-align:left">
                                                                                            Quantity
                                                                                        </th>
                                                                                        <th class="x_td" scope="col" style="color:#333333; border:1px solid #e5e5e5; vertical-align:middle; padding:12px; text-align:left">
                                                                                            Price
                                                                                        </th>
                                                                                    </tr>
                                                                                    </thead>
                                                                                    <tbody>
                                                                                    @foreach($order->products ?? [] as $el)
                                                                                        <tr class="x_order_item">
                                                                                            <td class="x_td" style="color:#333333; border:1px solid #e5e5e5; padding:12px; text-align:left; vertical-align:middle; font-family:'Helvetica Neue',Helvetica,Roboto,Arial,sans-serif; word-wrap:break-word">
                                                                                                {{ $el->id }}
                                                                                            </td>
                                                                                            <td class="x_td" style="color:#333333; border:1px solid #e5e5e5; padding:12px; text-align:left; vertical-align:middle; font-family:'Helvetica Neue',Helvetica,Roboto,Arial,sans-serif; word-wrap:break-word">
                                                                                                {{ $el->name_en }}
                                                                                            </td>
                                                                                            <td class="x_td" style="color:#333333; border:1px solid #e5e5e5; padding:12px; text-align:left; vertical-align:middle; font-family:'Helvetica Neue',Helvetica,Roboto,Arial,sans-serif; word-wrap:break-word">
                                                                                                {{ $el->color_name_ar ?? '-' }}
                                                                                            </td>
                                                                                            <td class="x_td" style="color:#333333;text-transform: uppercase; border:1px solid #e5e5e5; padding:12px; text-align:left; vertical-align:middle; font-family:'Helvetica Neue',Helvetica,Roboto,Arial,sans-serif; word-wrap:break-word">
                                                                                                {{ $el->size_name_en ?? '-' }}
                                                                                            </td>
                                                                                            <td class="x_td" style="color:#333333; border:1px solid #e5e5e5; padding:12px; text-align:left; vertical-align:middle; font-family:'Helvetica Neue',Helvetica,Roboto,Arial,sans-serif">
                                                                                                {{ $el->count }}
                                                                                            </td>
                                                                                            <td class="x_td" style="color:#333333; border:1px solid #e5e5e5; padding:12px; text-align:left; vertical-align:middle; font-family:'Helvetica Neue',Helvetica,Roboto,Arial,sans-serif">
                                                                                            <span class="x_woocommerce-Price-amount x_amount">
                                                                                                {{ $el->sale_price }}
                                                                                                <span class="x_woocommerce-Price-currencySymbol">
                                                                                                    {{ $order?->currency?->name_en ?? '' }}
                                                                                                </span>
                                                                                            </span>
                                                                                            </td>
                                                                                        </tr>
                                                                                    @endforeach
                                                                                    </tbody>
                                                                                    <tfoot>
                                                                                    <tr>
                                                                                        <th class="x_td" scope="row" colspan="5" style="color:#333333; border:1px solid #e5e5e5; vertical-align:middle; padding:12px; text-align:left; border-top-width:4px">
                                                                                            Subtotal:
                                                                                        </th>
                                                                                        <td class="x_td" style="color:#333333; border:1px solid #e5e5e5; vertical-align:middle; padding:12px; text-align:left; border-top-width:4px">
                                                                                        <span class="x_woocommerce-Price-amount x_amount">
                                                                                            {{ $order->amount }}
                                                                                            <span class="x_woocommerce-Price-currencySymbol">
                                                                                                {{ $order?->currency?->name_en ?? ''  }}
                                                                                            </span>
                                                                                        </span>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <th class="x_td" scope="row" colspan="5" style="color:#333333; border:1px solid #e5e5e5; vertical-align:middle; padding:12px; text-align:left">
                                                                                            Payment method:
                                                                                        </th>
                                                                                        <td class="x_td" style="color:#333333; border:1px solid #e5e5e5; vertical-align:middle; padding:12px; text-align:left">
                                                                                            Cash on delivery
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <th class="x_td" scope="row" colspan="5" style="color:#333333; border:1px solid #e5e5e5; vertical-align:middle; padding:12px; text-align:left">
                                                                                            Total:
                                                                                        </th>
                                                                                        <td class="x_td" style="color:#333333; border:1px solid #e5e5e5; vertical-align:middle; padding:12px; text-align:left">
                                                                                        <span class="x_woocommerce-Price-amount x_amount">
                                                                                            {{ $order->amount }}
                                                                                            <span class="x_woocommerce-Price-currencySymbol">
                                                                                                {{ $order?->currency?->name_en ?? ''  }}
                                                                                            </span>
                                                                                        </span>
                                                                                        </td>
                                                                                    </tr>
                                                                                    </tfoot>
                                                                                </table>
                                                                            </div>
                                                                            <table id="x_addresses" cellspacing="0" cellpadding="0" border="0" style="width:100%; vertical-align:top; margin-bottom:40px; padding:0">
                                                                                <tbody>
                                                                                <tr>
                                                                                    <td valign="top" width="50%" style="text-align:left; font-family:'Helvetica Neue',Helvetica,Roboto,Arial,sans-serif; border:0; padding:0">
                                                                                        <h2 style="color:#503e91; display:block; font-family:&quot;Helvetica Neue&quot;,Helvetica,Roboto,Arial,sans-serif; font-size:18px; font-weight:bold; line-height:130%; margin:0 0 18px; text-align:left">
                                                                                            Billing address
                                                                                        </h2>
                                                                                        <address class="x_address" style="padding:12px; color:#333333; border:1px solid #e5e5e5">
                                                                                            <br aria-hidden="true">
                                                                                            First Name: {{ $order?->billingAddress?->first_name ?? '' }}
                                                                                            <br aria-hidden="true">
                                                                                            First Name: {{ $order?->billingAddress?->first_name ?? '' }}
                                                                                            <br aria-hidden="true">
                                                                                            Last Name: {{ $order?->billingAddress?->last_name ?? '' }}
                                                                                            <br aria-hidden="true">
                                                                                            Company Name: {{ $order?->billingAddress?->company_name ?? '' }}
                                                                                            <br aria-hidden="true">
                                                                                            Street Address: {{ $order?->billingAddress?->street_address ?? ''}}
                                                                                            <br aria-hidden="true">
                                                                                            Town: {{ $order?->billingAddress?->town ?? '' }}
                                                                                            <br aria-hidden="true">
                                                                                            State: {{ $order?->billingAddress?->state ?? '' }}
                                                                                            <br aria-hidden="true">
                                                                                            State: {{ $order?->billingAddress?->state ?? '' }}
                                                                                            <br aria-hidden="true">
                                                                                            Zip Code: {{ $order?->billingAddress?->zip ?? '' }}
                                                                                            <br aria-hidden="true">
                                                                                            Email: <a href="mailto:{{ $order?->billingAddress?->email ?? '' }}">
                                                                                                {{ $order?->billingAddress?->email ?? '' }}
                                                                                            </a>
                                                                                            <br aria-hidden="true">
                                                                                            Phone: <a href="tel:{{ $order?->billingAddress?->phone ?? '' }}">
                                                                                                {{ $order?->billingAddress?->phone ?? '' }}
                                                                                            </a>
                                                                                            <br aria-hidden="true">
                                                                                            @if($order?->billingAddress?->latitude && $order?->billingAddress?->longitude)
                                                                                                <a href="https://www.google.com/maps/search/?api=1&query={{$order?->billingAddress?->latitude ?? ''}},{{$order?->billingAddress?->longitude ?? ''}}"
                                                                                                   target="_blank">
                                                                                                    Location On Map
                                                                                                </a>
                                                                                                <br aria-hidden="true">
                                                                                            @endif
                                                                                            Note: {{ $order?->billingAddress?->note ?? '' }}
                                                                                            <br aria-hidden="true">
                                                                                        </address>
                                                                                    </td>
                                                                                </tr>
                                                                                </tbody>
                                                                            </table>
                                                                            <p style="margin:0 0 16px">
                                                                                Thanks for using
                                                                                {{ url('/') }}!
                                                                            </p>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                </tbody>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" valign="top">
                                    <table border="0" cellpadding="10" cellspacing="0" width="600" id="x_template_footer" style="height:150px; background-position:center; background-repeat:no-repeat; background-size:cover">
                                        <tbody>
                                        <tr>
                                            <td valign="top" style="padding:0; border-radius:6px">
                                                <table border="0" cellpadding="10" cellspacing="0" width="100%">
                                                    <tbody>
                                                    <tr>
                                                        <td colspan="5" valign="middle" id="x_credit" style="border-radius:6px; border:0; color:#666666; font-family:&quot;Helvetica Neue&quot;,Helvetica,Roboto,Arial,sans-serif; font-size:12px; line-height:150%; text-align:center; padding:24px 0">
                                                            <p style="margin:0 0 16px">
                                                                Iron Bridge
                                                            </p>
                                                        </td>
                                                    </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
