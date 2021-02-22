@extends('layouts.app')
@section('content')

    @if (!$store)
        <a href="{{ route('admin.stores.create') }}" class="btn btn-success">Criar Lojas</a>
    @else
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Loja</th>
                    <th>Total de produtos</th>
                    <th>Ações</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>{{ $store->id }}</td>
                    <td>{{ $store->name }}</td>
                    <td>{{ $store->products->count() }}</td>
                    <!--'products' como atributo, trás uma colletion podendo usar método count()-->
                    <td>

                        <a class="btn btn-warning btn-sm"
                            href="{{ route('admin.stores.edit', ['store' => $store->id]) }}">Editar</a>
                        <div class="btn-group">

                            <form action="{{ route('admin.stores.destroy', ['store' => $store->id]) }}" method="post">
                                @csrf
                                @method('DELETE')
                                <button type="submit" class="btn btn-danger btn-sm">Excluir</button>
                            </form>

                        </div>
                    </td>
                </tr>

            </tbody>
        </table>

    @endif




@endsection
