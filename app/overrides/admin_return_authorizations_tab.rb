Deface::Override.new(
  virtual_path: "spree/admin/shared/_menu",
  name: "admin_return_authorizations_tab",
  insert_bottom: "[data-hook='admin_tabs']",
  text: "<%= tab :returns, url: admin_return_authorization_requests_path, icon: 'reply-all' %>"
)
