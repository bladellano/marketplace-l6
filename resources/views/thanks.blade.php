@extends('layouts.front')

@section('content')

    <h2 class="alert alert-success">
        Muito obrigado por sua compra!
    </h2>
    <h4>
        Seu pedido foi processado, código do pedido {{ request()->get('order') }}
    </h4>

@endsection
