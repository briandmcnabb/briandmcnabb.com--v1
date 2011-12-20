class Admin::OmniauthController < Admin::ApplicationController
  
  def callback
    current_user.connections.find_with_omniauth(auth_hash) || current_user.connections.create_with_omniauth(auth_hash)
    redirect_to admin_connections_url, :notice => "Success! Your #{auth_hash.provider} account is connected!"
  end
  
  def failure
    redirect_to admin_connections_url, :alert => "authentication failed due to a(n) #{params[:message].humanize.downcase}"
  end
  
  
  
  protected
    
  def auth_hash
    request.env['omniauth.auth']
  end
  
end