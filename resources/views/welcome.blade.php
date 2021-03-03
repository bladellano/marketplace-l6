@extends('layouts.front')

@section('content')

    <div class="row front">
        @foreach ($products as $key => $product)
            <div class="col-md-4">
                <div class="card" style="width: 98%">
                    @if ($product->photos->count())
                        <img style="width:100%; height:192px;object-fit:cover;" src="{{ asset('storage/' . $product->photos->first()->image) }}" alt="{{ $product->name }}" class="card-img-top">
                    @else
                        <img src="{{ asset('assets/img/no-photo.jpg') }}" alt="{{ $product->name }}"
                            class="card-img-top">
                    @endif
                    <div class="card-body">
                        <h4 class="card-title">{{ $product->name }}</h4>
                        <p class="card-text">{{ $product->description }}</p>
                        <h3>R$ {{ number_format($product->price,2,",",".")  }}</h3>
                        <a href="{{route('product.single',['slug'=>$product->slug])}}" class="btn btn-success">
                            Ver Produto
                        </a>
                    </div>
                </div>
            </div>

            @if (($key + 1) % 3 == 0) </div><div class="row front">@endif

        @endforeach
    </div>

    <div class="row">
        <div class="col-12">
            <h2>Lojas Destaque</h2>
            <hr>
        </div>
        @foreach ($stores as $store)
            <div class="col-4">
                @if ($store->logo)

                <img style="width:100%; height:192px;object-fit:cover;" src="{{'storage/'.$store->logo}}" alt="Logo da loja {{$store->name}}" class="img-fluid">

                @else

                <img style="width:100%; height:192px;object-fit:cover;" src="https://via.placeholder.com/450x192.png?text={{$store->name}}" alt="Loja sem logo..." class="img-fluid">

                @endif

                <h3>{{$store->name}}</h3>
                <p>
                    {{$store->description}}
                </p>
                <a href="{{route('store.single',['slug'=>$store->slug])}}" class="btn btn-sm btn-success">Ver Loja</a>
            </div>
        @endforeach
    </div>

@endsection
