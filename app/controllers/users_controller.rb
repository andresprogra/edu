class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  def edit
    if current_user.cargo==0
      @user = User.find(params[:id])
    else
      redirect_to root_path, notice: "Debes ser administrador."
    end
  end
  def all
    if current_user.cargo==0
      @user = User.all
    else
      redirect_to root_path, notice: "Debes ser administrador."
    end
  end
  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to users_all_path, notice: "Usuario eliminado."
    end

  end
  def new
    @yolo = User.new
  end
  def create
  end
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
  		@cargo = "Administrativo"
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
  		@cargo = "Administrativo"
  	end
  end
  
  
end
