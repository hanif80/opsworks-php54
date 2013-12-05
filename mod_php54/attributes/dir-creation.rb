%w{profile_picture lead_images client_images repair_images purchase_images wish_images sales_images}.each do |dir|
  directory "/APPLICATION PATH/images/#{dir}" do
    mode 00775
    owner "root"
    group "root"
    action :create
    recursive true
  end
end
