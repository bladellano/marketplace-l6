<?php

namespace App\Http\Controllers\Admin;

use App\Product;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\ProductRequest;
use App\Traits\UploadTrait;

class ProductController extends Controller
{
    use UploadTrait;

    private $product;

    public function __construct(Product $product)
    {
        $this->product = $product;
    }
    /**
     * Display a listing of the resource.
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $userStore = auth()->user()->store; //Com usuário autenticado, acesso objeto user(), em seguida a ligação store (loja do usuário).
        // $products = $this->product->paginate(10);
        $products = $userStore->products()->paginate(10); //Através da loja, acesso a ligação products() e chamo método paginate().
        return view('admin.products.index', compact('products'));
    }

    /**
     * Show the form for creating a new resource.
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $categories = \App\Category::all(['id', 'name']);
        return view('admin.products.create', compact('categories'));
    }

    /**
     * Store a newly created resource in storage.
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(ProductRequest $request)
    {

        $data = $request->all();

        //'NULL' passando null como segundo parametro, será o valor default se não vier nada em categories
        $categories = $request->get('categories', NULL);

        //$store = \App\Store::find($data['store']);
        $store = auth()->user()->store; //Trás loja do usuário (autenticado) por meio da ligação. Obs.: store() = HasOne
        $product = $store->products()->create($data); //Utiliza a ligação de produtos para criar o produto que retorna um objeto produto.
        //$product->categories()->sync($data['categories']); //Através do objeto acessa a ligação categories() para utilizar método sync()
        $product->categories()->sync($categories); //Através do objeto acessa a ligação categories() para utilizar método sync()

        if ($request->hasFile('photos')) { //Verifica se está sendo enviado arquivo vindo do request.
            $images = $this->imageUpload($request->file('photos'), 'image');
            //Usando a ligação photos() para salvar as imagens.
            $product->photos()->createMany($images); //createMany() - Aceita vários arrays para registros.
        }

        flash('Produto criado com sucesso!')->success();
        return \redirect()->route('admin.products.index');
    }

    /**
     * Display the specified resource.
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($product)
    { }

    /**
     * Show the form for editing the specified resource.
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($product)
    {
        $product = $this->product->findOrFail($product);
        $categories = \App\Category::all(['id', 'name']);
        return view('admin.products.edit', compact('product', 'categories'));
    }

    /**
     * Update the specified resource in storage.
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $product
     * @return \Illuminate\Http\Response
     */
    public function update(ProductRequest $request, $product)
    {
        $data = $request->all();
        $categories = $request->get('categories', NULL);
        $product = $this->product->find($product);
        $product->update($data);

        if (!is_null($categories))//Se categories não for nulo.
            $product->categories()->sync($categories); //Através do objeto acessa a ligação categories() para utilizar método sync()

        if ($request->hasFile('photos')) { //Verifica se está sendo enviado arquivo vindo do request.
            $images = $this->imageUpload($request->file('photos'), 'image');
            //Usando a ligação photos() para salvar as imagens.
            $product->photos()->createMany($images); //createMany() - Aceita vários arrays para registros.
        }

        flash('Produto atualizado com sucesso!')->success();
        return \redirect()->route('admin.products.index');
    }

    /**
     * Remove the specified resource from storage.
     * @param  int  $product
     * @return \Illuminate\Http\Response
     */
    public function destroy($product)
    {
        $product = $this->product->find($product);
        $product->delete();

        flash('Produto removido com sucesso!')->success();
        return \redirect()->route('admin.products.index');
    }
}
