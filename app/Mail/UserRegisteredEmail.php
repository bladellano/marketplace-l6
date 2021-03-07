<?php

namespace App\Mail;

use App\User;
use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Queue\ShouldQueue;

class UserRegisteredEmail extends Mailable
{
    use Queueable, SerializesModels;

    // private $user;
    public $user; //Passa automaticamente para view so mudando a visibilidade para public

    /**
     * Create a new message instance.
     * @return void
     */
    public function __construct(User $user)
    {
        $this->user = $user;
    }

    /**
     * Build the message.
     * @return $this
     */
    public function build()
    {
        return $this
        ->subject('Conta Criada com Sucesso!')
        ->replyTo('bladellano@gmail.com')
        ->view('emails.user-registered');
        // ->with(['user'=>$this->user]); // Para visibilidade private.
    }
}
