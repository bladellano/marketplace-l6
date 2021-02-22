@extends('layouts.app')


@section('content')

    <a href="{{ route('admin.categories.create') }}" class="btn btn-success">Criar Categoria</a>

    <table class="table table-striped">
        <thead>
            <tr>
                <th>#</th>
                <th>Nome</th>
                <th>Ações</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($categories as $category)
                <tr>
                    <td>{{ $category->id }}</td>
                    <td>{{ $category->name }}</td>
                    <td width="15%">
                        <a href="{{ route('admin.categories.edit', ['category' => $category->id]) }}"
                            class="btn btn-sm btn-warning">Editar</a>
                        <div class="btn-group">

                            <form action="{{ route('admin.categories.destroy', ['category' => $category->id]) }}"
                                method="post">
                                @csrf
                                @method("DELETE")
                                <button type="submit" class="btn btn-sm btn-danger">Excluir</button>
                            </form>
                        </div>
                    </td>
                </tr>
            @endforeach
        </tbody>
    </table>
@endsection
