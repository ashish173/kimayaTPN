class Users::InvitationsController < Devise::InvitationsController 
  before_filter :set_menu

  def new
    build_resource
    render :new, layout: 'user'
  end

  def create
    self.resource = resource_class.invite!(resource_params, current_inviter)

    self.resource.hospitals << current_hospital
    if resource.errors.empty?
      set_flash_message :notice, :send_instructions, :email => self.resource.email
      respond_with resource, :location => after_invite_path_for(resource), layout: 'user'
    else
      respond_with_navigational(resource) { render :new, layout: 'user'}
    end 
    
  end

  def set_menu
    @selected_menu = DOCTOR 
    @sidemenu = INVITE
  end

end
