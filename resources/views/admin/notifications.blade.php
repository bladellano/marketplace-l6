@extends('layouts.app')

@section('content')


    <div class="row">
        <div class="col-md-12 mb-3">
            <a href="{{ route('admin.notifications.read.all') }}" class="btn btn-success">Marcar todos como lidas</a>
        </div>
    </div>

    <table class="table table-striped">
        <thead>
            <tr>
                <th>Notificação</th>
                <th>Criado em</th>
                <th>Ações</th>
            </tr>
        </thead>
        <tbody>
            @forelse ($unreadNotifications as $n)
                <tr>
                    <td>{{ $n->data['message'] }}</td>
                    {{-- <td>{{ $n->created_at->format('d/m/Y') }}</td> --}}
                    <td>{{ $n->created_at->locale('pt')->diffForHumans() }}</td>
                    <td>
                        <div class="btn-group">
                            <a href="{{ route('admin.notifications.read', ['notification' => $n->id]) }}"
                                class="btn btn-sm btn-primary">Marcar como lida</a>
                        </div>
                    </td>
                </tr>
            @empty
                <tr>
                    <td colspan="3">
                        <div class="alert alert-warning">Nenhuma notificação encontrada!</div>
                    </td>
                </tr>

            @endforelse
        </tbody>
    </table>

@endsection
