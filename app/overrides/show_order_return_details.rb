Deface::Override.new(
  virtual_path: 'spree/orders/show',
  name: 'show_order_return_details',
  insert_after: "[data-hook='links']",
  text: "<%= render partial: 'spree/orders/return_authorization_details', locals: { order: @order } %>"
)
