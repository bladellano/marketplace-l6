<?php

namespace App\Traits;

trait UploadTrait
{
    /**
     * Método para uploda de imagens
     * @param [type] $images caminho da imagem
     * @param [type] $imageColumn nome do campo na tabela
     * @return void
     */
    private function imageUpload($images, $imageColumn = NULL)
    {
        $uploadedImages = [];

        if (is_array($images)) {
            foreach ($images as $image) {
                $uploadedImages[] = [$imageColumn => $image->store('products', 'public')];
            }
        } else {
            $uploadedImages = $images->store('logo', 'public');
        }
        return $uploadedImages;
    }
}
