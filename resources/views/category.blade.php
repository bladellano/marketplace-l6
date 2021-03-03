@extends('layouts.front')

@section('content')

    <div class="row front">

        <div class="col-12">
            <h2>{{$category->name}}</h2><hr>
        </div>
       @forelse ($category->products as $key => $product)
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
            <h5 class="alert alert-warning">Nenhum produto encontrado para esta categoria!</h5>
        </div>

      @endforelse

</div>

@endsection
