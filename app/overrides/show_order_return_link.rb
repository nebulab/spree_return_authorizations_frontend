Deface::Override.new(
  virtual_path: "spree/orders/show",
  name: "show_order_return_link",
  insert_bottom: "[data-hook='links']",
  text: "<%= link_to \"Ask return\", new_return_order_path(@order), class: 'button' %>",
  disabled: true
)
