Spree::Core::Engine.routes.draw do
  get '/orders/:order_id/return' => 'orders/return_authorizations#new', as: :new_order_return_authorization
  post '/orders/:order_id/return' => 'orders/return_authorizations#create', as: :order_return_authorizations
end
