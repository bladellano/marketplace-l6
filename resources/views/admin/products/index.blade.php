@extends('layouts.app')
@section('content')

<a href="{{route('admin.products.create')}}" class="btn btn-success">Criar Produto</a>
    <table class="table table-striped">
        <thead>
            <tr>
                <th>#</th>
                <th>Nome</th>
                <th>Preço</th>
                <th>Loja</th>
                <th>Ações</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($products as $product)
                <tr>
                    <td>{{ $product->id }}</td>
                    <td>{{ $product->name }}</td>
                    <td>R$ {{  number_format( $product->price,2,',','.') }}</td>
                    <td>{{ $product->store->name }}</td>
                    <td>
                        <a class="btn btn-warning btn-sm" href="{{route('admin.products.edit',['product'=>$product->id])}}">Editar</a>
                        <div class="btn-group">

                            <form action="{{route('admin.products.destroy',['product'=>$product->id])}}" method="post">
                                @csrf
                                @method('DELETE')
                                <button type="submit" class="btn btn-danger btn-sm">Excluir</button>
                            </form>

                        </div>
                    </td>
                </tr>

            @endforeach
        </tbody>
    </table>

    {{ $products->render() }}

@endsection
