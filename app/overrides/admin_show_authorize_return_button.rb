Deface::Override.new(
  virtual_path: "spree/admin/return_authorizations/edit",
  name: "admin_show_authorize_return_button",
  insert_before: "erb[loud]:contains('button_link_to Spree.t(:back)')",
  text: "<% if @return_authorization.try(:pending?) %><%= button_link_to Spree.t('actions.authorize'), fire_admin_order_return_authorization_url(@order, @return_authorization, e: 'authorize'), method: :put, data: { confirm: Spree.t(:are_you_sure) }, :icon => 'ok' %><% end %>"
)
