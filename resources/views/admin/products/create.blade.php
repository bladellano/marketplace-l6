@extends('layouts.app')

@section('content')
    <h1>Criar Produto</h1>
    <form action="{{ route('admin.products.store') }}" method="post" enctype="multipart/form-data">
        @csrf
        <div class="form-group">
            <label for="">Nome do Produto</label>
            <input type="text" class="form-control @error('name') is-invalid @enderror" name="name" value="{{old('name')}}">
             @error('name') <div class="invalid-feedback"> {{ $message }}</div> @enderror

        </div>

        <div class="form-group">
            <label for="">Descrição</label>
            <input type="text" class="form-control @error('description') is-invalid @enderror" name="description" value="{{old('description')}}">
             @error('description') <div class="invalid-feedback"> {{ $message }}</div> @enderror
        </div>

        <div class="form-group">
            <label for="">Conteúdo</label>
            <textarea name="body" id="body" cols="30" rows="4" class="form-control @error('body') is-invalid @enderror">{{old('body')}}</textarea>
            @error('body') <div class="invalid-feedback"> {{ $message }}</div> @enderror
        </div>

        <div class="form-group">
            <label for="">Preço</label>
            <input type="text" class="form-control @error('price') is-invalid @enderror" name="price" value="{{old('price')}}">
             @error('price') <div class="invalid-feedback"> {{ $message }}</div> @enderror
        </div>


        <div class="form-group">
            <label for="">Categorias</label>
            <select name="categories[]" class="form-control" multiple>
                @foreach ($categories as $category)
                <option
                    @if( !is_null(old('categories') ) )
                        @if( in_array($category->id, old('categories') ) )  selected
                        @endif
                    @endif value="{{$category->id}}">{{$category->name}}</option>
                @endforeach
            </select>
        </div>

        <div class="form-group">
            <label>Fotos do Produto</label>
            <input type="file" name="photos[]" multiple class="form-control @error('photos.*') is-invalid @enderror">
            @error('photos.*') <div class="invalid-feedback">{{$message}}</div> @enderror
        </div>

    {{--     <div class="form-group">
            <label for="">Slug</label>
            <input type="text" class="form-control control @error('slug') is-invalid @enderror" name="slug">
             @error('slug') <div class="invalid-feedback"> {{ $message }}</div> @enderror

        </div> --}}

        <div class="form-group">
            <button type="submit" class="btn btn-success btn-lg">Criar Produto</button>
        </div>
    </form>
@endsection
