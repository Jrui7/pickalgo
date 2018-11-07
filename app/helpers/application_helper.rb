module ApplicationHelper
  def resource_name
     :user
   end

   def resource_class
      User
   end

   def resource
     @resource ||= User.new
   end

   def devise_mapping
     @devise_mapping ||= Devise.mappings[:user]
   end

   def stripe_url
    "https://connect.stripe.com/oauth/authorize?response_type=code&client_id=#{ENV['STRIPE_CONNECT_CLIENT_ID']}&scope=read_write"
   end
end
