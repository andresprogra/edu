class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  
  def index
  	@user = current_user
  	if @user.carrera == nil
  		@background = "hola.jpg"
  		redirect_to edit_user_registration_path, alert: "Para continuar con el uso de la plataforma, debes llenar toda tu información."
  	elsif @user.carrera == "Programación"
  		@background = "programacion.jpg"
  	else
  		@background = "agropecuario.jpg"
  	end
  	if @user.cargo == 1
  		@cargo = "Alumno"
  	else
  		@cargo = "Admnistrativo"
  	end
  end
  def show
  	@user = User.find(params[:id])
  	if @user.carrera == nil
  		@background = "hola.jpg"
  	elsif @user.carrera == "Programación"
  		@background = "programacion.jpg"
  	else
  		@background = "agropecuario.jpg"
  	end
  	if @user.cargo == 1
  		@cargo = "Alumno"
  	else
  		@cargo = "Admnistrativo"
  	end
  end
  
end
