<?php

namespace App\Http\Controllers;

use App\Payment\PagSeguro\CreditCard;
use Illuminate\Http\Request;

class CheckoutController extends Controller
{
    public function index()
    {
        if (!\auth()->check()) {
            return redirect()->route('login');
        }
        // session()->forget('pagseguro_session_code');
        $this->makePagSeguroSession();

        $cartItems = array_map(function ($line) {
            return $line['amount'] * $line['price'];
        }, session()->get('cart'));
        $cartItems = array_sum($cartItems);

        var_dump(session()->get('pagseguro_session_code'));
        return view('checkout', compact('cartItems'));
    }

    private function makePagSeguroSession()
    {

        if (!session()->has('pagseguro_session_code')) {
            $sessionCode = \PagSeguro\Services\Session::create(
                \PagSeguro\Configuration\Configure::getAccountCredentials()
            );
            return session()->put('pagseguro_session_code', $sessionCode->getResult());
        }
    }

    public function proccess(Request $request)
    {
        $dataPost = $request->all();
        $user = auth()->user();
        $cartItems = session()->get('cart');
        $reference = 'XPTO';

        $creditCardPayment = new CreditCard($cartItems, $user, $dataPost, $reference);
        $result = $creditCardPayment->doPayment();

        $userOrder = [
            'reference' => $reference,
            'pagseguro_code' => $result->getCode(),
            'pagseguro_status' => $result->getStatus(),
            'items' => serialize($cartItems),
            'store_id' => 42
        ];

        $user->orders()->create($userOrder);

        return response()->json([
            'data' => [
                'status' => true,
                'message' => 'Pedido criado com sucesso'
            ]
        ]);
    }
}
