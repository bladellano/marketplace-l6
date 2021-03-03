@extends('layouts.front')

@section('content')

    <div class="row front">
        {{-- Exibindo imagem da loja --}}
        <div class="col-4">
            @if ($store->logo)
            <img style="width:100%; height:136px;object-fit:cover;" src="{{'../storage/'.$store->logo}}" alt="Logo da loja {{$store->name}}" class="img-fluid">
            @else

            <img style="width:100%; height:136px;object-fit:cover;" src="https://via.placeholder.com/450x192.png?text={{$store->name}}" alt="Loja sem logo..." class="img-fluid">

            @endif
        </div>
        <div class="col-8">

            <h2>{{$store->name}}</h2>
            <p>{{$store->description}}
                <h6><strong>Contatos:</strong></h6>
                <span>{{$store->phone}}</span> | <span>{{$store->mobile_phone}}</span>
            </p>
        </div>
       {{-- Exibindo imagem da loja - end --}}

        <div class="col-12">
            <h3 style="margin-bottom: 20px">Produtos desta loja</h3>
        </div>

       @forelse ($store->products as $key => $product)
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

      @empty

        <div class="col-12">
            <h5 class="alert alert-warning">Nenhum produto encontrado para esta loja!</h5>
        </div>

      @endforelse

</div>

@endsection
