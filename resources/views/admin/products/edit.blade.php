@extends('layouts.app')

@section('content')

    <form action="{{ route('admin.products.update', ['product' => $product->id]) }}" method="post" enctype="multipart/form-data">

        @csrf
        @method('PUT')

        <div class="form-group">
            <label>Nome do Produto</label>
            <input type="text" class="form-control @error('name') is-invalid @enderror"" value=" {{ $product->name }}"
                name="name">
            @error('name') <div class="invalid-feedback"> {{ $message }}</div> @enderror
        </div>

        <div class="form-group">
            <label>Descrição</label>
            <input type="text" class="form-control @error('description') is-invalid @enderror"" value="{{ $product->description }}" name="description">
            @error('description') <div class="invalid-feedback"> {{ $message }}</div> @enderror
        </div>

        <div class="form-group">
            <label>Conteúdo</label>
            <textarea name="body" id="body" cols="30" rows="4" class="form-control  @error('body') is-invalid @enderror"">{{ $product->body }}</textarea>
                @error('body') <div class=" invalid-feedback"> {{ $message }}</div> @enderror
            </div>

            <div class="form-group">
                <label>Preço</label>
                <input type="text" class="form-control  @error('price') is-invalid @enderror"" value="{{ $product->price }}" name="price">
                @error('price') <div class="invalid-feedback"> {{ $message }}</div> @enderror

            </div>

            <div class="form-group">
                <label>Categorias</label>
                <select name="categories[]" class="form-control  @error('categories') is-invalid @enderror"" multiple>
                    @foreach ($categories as $category)
                        <option value="{{ $category->id }}" @if ($product->categories->contains($category)) selected @endif>
                            {{ $category->name }}</option>
                    @endforeach
                </select>
                @error('categories') <div class="invalid-feedback"> {{ $message }}</div> @enderror
            </div>

            <div class="form-group">
                <label>Fotos do Produto</label>
                <input type="file" name="photos[]" multiple class="form-control @error('photos') is-invalid @enderror">
                @error('photos') <div class="invalid-feedback">{{$message}}</div> @enderror
            </div>

            <div class="form-group">
                <button type="submit" class="btn btn-success btn-lg">Atualizar Produto</button>
            </div>
        </form>
        <hr>
        <div class="row">
            @foreach ($product->photos as $photo)
            <div class="col-md-2 text-center">
                <img src="{{asset('storage/'.$photo->image)}}" class="img-fluid">
                <form action="{{route('admin.photo.remove')}}" method="post">
                    @csrf
                <input type="hidden" name="photoName" value={{$photo->image}}>
                <button type="submit" class="btn btn-danger btn-sm">Remover</button>
                </form>
            </div>
            @endforeach
        </div>
@endsection
