<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class CartController extends Controller
{
    public function index()
    {
        $cart = session()->has('cart') ? session()->get('cart') : [];
        return view('cart', compact('cart'));
    }

    public function add(Request $request)
    {
        $product = $request->get('product');

        if (session()->has('cart')) {

            $products = session()->get('cart');
            $productsSlugs = array_column($products, 'slug');

            //Procura em $productsSlugs se o produto que está sendo adicionado já possui o mesmo slug.
            if (in_array($product['slug'], $productsSlugs)) {
                $products = $this->productIncrement($product['slug'], $product['amount'], $products);
                session()->put('cart', $products);
            } else {
                //Se não, adiciona normalmentel.
                session()->push('cart', $product);
            }
        } else {
            $products[] = $product;
            session()->put('cart', $products);
        }

        flash('Produto adicionado no carrinho!')->success();
        return redirect()->route('product.single', ['slug' => $product['slug']]);
    }

    public function remove($slug)
    {

        if (!session()->has('cart'))
            return redirect()->route('cart.index');

        $products = session()->get('cart');

        $products = array_filter($products, function ($line) use ($slug) {
            return $line['slug'] != $slug;
        });

        session()->put('cart', $products); //PUT atualiza a sessão.
        return redirect()->route('cart.index');
    }

    public function cancel()
    {
        session()->forget('cart'); //Cancela sessão.
        flash('Desistência de compra realizada com sucesso!')->success();
        return \redirect()->route('cart.index');
    }

    /**
     * Método de incremento que trata a duplicidade de produtos para
     * a mesma quantidade de itens.
     * @param string $slug Slug da requisição do único produto sendo adicionado.
     * @param integer $amount Amount da requisição do único produto sendo adicionado.
     * @param array $products_session O objeto products da sessão.
     * @return void
     */
    private function productIncrement(string $slug, int $amount, array $products_session)
    {
        // $line = linhas do array
        // $slug e $amount - passado via 'use' para entrar dentro do escopo da função da anônima.
        $products = array_map(function ($line) use ($slug, $amount) {
            if ($slug == $line['slug']) {
                $line['amount'] += $amount;
            }
            return $line;
        }, $products_session);
        return $products;
    }
}
