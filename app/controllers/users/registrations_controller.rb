class Users::RegistrationsController < Devise::RegistrationsController
# before_filter :configure_sign_up_params, only: [:create]
# before_filter :configure_account_update_params, only: [:update]
  # GET /resource/sign_up
  # def new
  #   super
  # end
  def all
    @user = User.all
  end
  def show
    @user = User.find(params[:id])
  end

  # POST /resource
  # def create
  #   super
  # end

  def edit
     @user = User.find(current_user)

   end

  # PUT /resource
   def update
    @user = User.find(current_user)
      if @user.update(user_params)
        @user.update(puntos: @user.puntos + 1)
        redirect_to root_path, notice: "Sus datos han sido actualizado correctamente."
      else
        render :edit, notice: "Lo sentimos, ocurrió un error. Intentalo de nuevo."
      end
   end
  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.for(:sign_up) << :attribute
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.for(:account_update) << :attribute
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
  private
  def user_params
    params.require(:user).permit(:name,:apellido,:semestre,:grupo,:carrera,:matricula)
  end
end
