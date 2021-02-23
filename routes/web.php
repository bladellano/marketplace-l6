<?php

Route::get('/', 'HomeController@index')->name('home');
Route::get('/product/{slug}', 'HomeController@single')->name('product.single');

Route::prefix('cart')->name('cart.')->group(function () {
    Route::get('/', 'CartController@index')->name('index');
    Route::post('add', 'CartController@add')->name('add');
    Route::get('remove/{slug}', 'CartController@remove')->name('remove');
    Route::get('cancel', 'CartController@cancel')->name('cancel');
});

Route::prefix('checkout')->name('checkout.')->group(function(){
    Route::get('/','CheckoutController@index')->name('index');
    Route::post('/proccess','CheckoutController@proccess')->name('proccess');
});


Route::get('/model', function () {

    // $produtcs = \App\User::all();

    // $user = new \App\User();
    // $user = \App\User::find('3');
    // $user->name = 'Usuário editado';
    // $user->email = 'bladellano@gmail.com';
    // $user->password = bcrypt('123456');
    // $user->save();

    // return \App\User::where('id','3');
    // return \App\User::where('name','Talon Borer')->get();
    // return \App\User::paginate(10);

    // MASS ASSIGNMENT OR UPDATE ASSIGNMENT
    // $user = \App\User::create([
    //     'name' => 'Fulano',
    //     'email' => 'fulando@gmail.com',
    //     'password' => bcrypt('123456')
    // ]);

    // dd($user);

    // $user = \App\User::find(2);
    // $user = $user->update([
    //     'name' => 'Editado com mass update'
    // ]);
    // dd($user);

    // $user = \App\User::find(4);
    // dd($user->store()->count());
    // return $user->store;

    // $loja = \App\Store::find(1);
    // return $loja->products()->where('id',1)->get();
    // return $loja->products->count();
    // return $loja->products;

    /* produtos de uma categoria */
    // $categoria = \App\Category::find(1);
    // return $categoria->products;

    // Criar uma loja para um usuário:
    /* $user = \App\User::find(10);
                 $store = $user->store()->create([ //"create" sempre retorna um objeto.
                    'name'=>'Croi Informatica',
                    'description'=>'Produtos de informática',
                    'phone' => '91-9999-88888',
                    'mobile_phone' => '91-9999-88888',
                    'slug'=>'croi-informatica'
                 ]);
                 dd($store); */

    // Criar um produto para uma loja:
    /* $store = \App\Store::find(4);
                $product = $store->products()->create([
                    'name' => 'Notebook Dell',
                    'description' => 'Core I5 10 GB',
                    'body' => 'Lorem ipsum is simply',
                    'price' => 2999.90,
                    'slug' => 'notebook-dell'
                ]);
                dd($product);//41 */

    // Criar uma categoria;
    /* \App\Category::create([
                        'name'=>'Games',
                        'description'=>null,
                        'slug'=>'games',
                    ]);

                    \App\Category::create([
                        'name'=>'Notebooks',
                        'description'=>null,
                        'slug'=>'notebooks',
                    ]);

                    return \App\Category::all(); */

    // Adicionar um produto para uma categoria ou vice-versa:
    /* $product = \App\Product::find(41);
                        $result = $product->categories()->attach([1]); //Remove
                        $result = $product->categories()->detach([1]); //Adiciona
                        $result = $product->categories()->sync([2]);
                        dd($result); */

    $product = \App\Product::find(41);
    return $product->categories;
    return $product;

    return \App\User::all();
});

Route::group(['middleware' => ['auth']], function () {
    Route::prefix('admin')->name('admin.')->namespace('Admin')->group(function () {

        /* Route::prefix('stores')->name('stores.')->group(function () {

            Route::get('', 'StoreController@index')->name('index');
            Route::get('/create', 'StoreController@create')->name('create');
            Route::post('/store', 'StoreController@store')->name('store');

            Route::get('/{store}/edit', 'StoreController@edit')->name('edit');
            Route::post('/update/{store}', 'StoreController@update')->name('update');
            Route::get('/destroy/{store}', 'StoreController@destroy')->name('destroy');

        }); */

        Route::resource('products', 'ProductController');
        Route::resource('stores', 'StoreController');
        Route::resource('categories', 'CategoryController');

        Route::post('photos/remove', 'ProductPhotoController@removePhoto')->name('photo.remove');
    });
});

Auth::routes();

// Route::get('/home', 'HomeController@index')->name('home');
