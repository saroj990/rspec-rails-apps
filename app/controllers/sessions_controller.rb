class SessionsController < Devise::SessionsController
  def new
    super
  end

  def create    
    if params[:role].present?
      if User.user_has_role?(params[:user][:email], params[:role])
        self.resource = warden.authenticate!(auth_options)
        set_flash_message!(:notice, :signed_in)
        sign_in(resource_name, resource)
        yield resource if block_given?
        respond_with resource, location: after_sign_in_path_for(resource)
      else        
        redirect_to new_user_session_path, :notice => "You don't have #{params[:role]} permission!! "
      end
    end

    
  end


end