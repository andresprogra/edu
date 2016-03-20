class WelcomeController < ApplicationController
  def index
    if current_user 
      if current_user.name == nil or current_user.matricula ==nil
    	 redirect_to edit_user_registration_path, alert: "Para continuar con el uso de la plataforma, debes llenar toda tu información."
      end
      t = Date.today()
      @ads = Ad.where('date >= ?', t)
      @ads_count = @ads.count
      semestre = current_user.semestre
      grupo = current_user.grupo
      carrera = current_user.carrera
      @classmate = User.where('id != ? AND semestre = ? AND grupo = ? AND carrera = ?', current_user.id  , semestre, grupo, carrera)
      @classmate_count = @classmate.count
    else
      redirect_to new_user_session_path, alert: "Para el uso de la plataforma, debes iniciar sesión."
    end
  end
  def edit
  	#redirect_to edit_user_registration_path	
  	#if user_singned_in?
  		#if curret_user.	
  	#end
    @user =User.all
    

  end
 

end
