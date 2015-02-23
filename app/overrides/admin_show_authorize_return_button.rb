Deface::Override.new(
  virtual_path: "spree/admin/shared/_content_header",
  name: "admin_show_authorize_return_button",
  insert_top: "[data-hook='toolbar'] > ul",
  text: "<% if @return_authorization.pending? %><li><%= button_link_to Spree.t('actions.authorize'), fire_admin_order_return_authorization_url(@order, @return_authorization, e: 'authorize'), method: :put, data: { confirm: Spree.t(:are_you_sure) }, :icon => 'ok' %></li><% end %>"
)
