<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Routing\Router;
use Illuminate\Notifications\Notification;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Messages\NexmoMessage;

class StoreReceiveNewOrder extends Notification
{
    use Queueable;

    /**
     * Create a new notification instance.
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Get the notification's delivery channels.
     * @param  mixed  $notifiable
     * @return array
     */
    public function via($notifiable)
    {
        // return ['mail'];
        return ['database', 'mail', 'nexmo'];
    }

    /**
     * Get the mail representation of the notification.
     * @param  mixed  $notifiable
     * @return \Illuminate\Notifications\Messages\MailMessage
     */
    public function toMail($notifiable)
    {
        return (new MailMessage)
            ->subject('Você recebeu um novo pedido!')
            ->greeting('Olá vendedor, tudo bem?')
            ->line('Você recebeu um novo pedido na loja!')
            ->action('Ver pedido', route('admin.orders.my'));
    }

    /**
     * Get the array representation of the notification.
     * @param  mixed  $notifiable
     * @return array
     */
    public function toArray($notifiable)
    {
        return [];
    }

    // Se tiver algum dado específico para ser salvo na base
    public function toDatabase()
    {
        return [
            'message' => 'Você tem um novo pedido solicitado'
        ];
    }

    //Notificação por sms
    public function toNexmo($notifiable)
    {
        return (new NexmoMessage)
            ->from('5591980104721')
            ->content('Você recebeu um novo pedido em nosso site!')
            ->unicode();
    }
}
