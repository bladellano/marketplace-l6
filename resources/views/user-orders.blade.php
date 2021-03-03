@extends('layouts.front')

@section('content')

    <div class="row">
        <div class="col-12">
            <h2>Meus Pedidos</h2>
            <hr>
        </div>
        <div class="col-12">
            <div id="accordion">

                @forelse ($userOrders as $key => $order)

                    <div class="card">
                        <div class="card-header" id="headingOne">
                            <h5 class="mb-0">
                                <button class="btn btn-link" data-toggle="collapse" data-target="#collapse_{{ $key }}"
                                    aria-expanded="true" aria-controls="collapse_{{ $key }}">
                                    Pedido nº: {{ $order->reference }}
                                </button>
                            </h5>
                        </div>

                        <div id="collapse_{{ $key }}" class="collapse  @if ($key==0) show @endif" aria-labelledby="heading_{{ $key }}"
                            data-parent="#accordion">
                            <div class="card-body">
                                <ul>
                                    @php $items = unserialize($order->items); @endphp
                                    @foreach ($items as $item)
                                        <li>{{ $item['name'] }} |
                                            {{ number_format($item['price'] * $item['amount'], 2, ',', '.') }}</li><br />
                                        Quantidade pedida: {{ $item['amount'] }}
                                    @endforeach
                                </ul>

                            </div>
                        </div>
                    </div>

                @empty
                    <div class="alert alert-warning">Nenhum pedido recebido</div>
                @endforelse

            </div>

            <hr>
            {{ $userOrders->render() }}
        </div>
    </div>

@endsection
