@extends('layouts.app')

@section('content')

    <form action="{{ route('admin.stores.store') }}" method="post" enctype="multipart/form-data">
        @csrf
        <div class="form-group">
            <label for="">Nome da Loja</label>
            <input type="text" class="form-control @error('name') is-invalid @enderror" value="{{ old('name') }}"
                name="name">
            @error('name') <div class="invalid-feedback"> {{ $message }}</div> @enderror
        </div>

        <div class="form-group">
            <label for="">Descrição</label>
            <input type="text" class="form-control @error('description') is-invalid @enderror"
                value="{{ old('description') }}" name="description">
            @error('description') <div class="invalid-feedback"> {{ $message }}</div> @enderror
        </div>

        <div class="form-group">
            <label for="">Telefone</label>
            <input type="text" class="form-control @error('phone') is-invalid @enderror" value="{{ old('phone') }}"
                name="phone">
            @error('phone') <div class="invalid-feedback"> {{ $message }}</div> @enderror
        </div>

        <div class="form-group">
            <label for="">Celular/Whatsapp</label>
            <input type="text" class="form-control @error('mobile_phone') is-invalid @enderror"
                value="{{ old('mobile_phone') }}" name="mobile_phone">
            @error('mobile_phone') <div class="invalid-feedback"> {{ $message }}</div> @enderror
        </div>

        <div class="form-group">
            <label>Logo</label>
            <input type="file" name="logo" class="form-control @error('logo') is-invalid @enderror">
            @error('logo') <div class="invalid-feedback">{{ $message }}</div> @enderror
        </div>

        <div class="form-group">
            <button type="submit" class="btn btn-success btn-lg">Criar Loja</button>
        </div>
    </form>
@endsection
