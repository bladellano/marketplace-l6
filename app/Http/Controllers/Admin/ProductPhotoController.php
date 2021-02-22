<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\ProductPhoto;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class ProductPhotoController extends Controller
{

    public function removePhoto(Request $request)
    {
        $photoName = $request->get('photoName');
        //Objeto Storage seleciona o disk 'public' e verifica se existe o arquivo $photoName
        if(Storage::disk('public')->exists($photoName)){
            Storage::disk('public')->delete($photoName);//Remove a foto.
        }

        $removePhoto = ProductPhoto::where('image',$photoName);
        $productId = $removePhoto->first()->product_id;//Pegando id do produto com base na busca acima - ProductPhoto::where('image',$photoName)

        $removePhoto->delete();

        flash('Imagem removida com sucesso!')->success();

        return redirect()->route('admin.products.edit',['product'=>$productId]);

    }

}
