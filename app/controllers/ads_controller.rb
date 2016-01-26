class AdsController < ApplicationController
  #before_action :validate_user, except: [:show,:index]
  before_action :authenticate_user!, except: [:show,:index]
  before_action :set_ads, except: [:index,:new,:create,:vencidos]
  def index
    #@ads = Ad.all
    #t = Time.now.strftime("%Y/%m/%d")
    @t = Date.today()
    t = Date.today()
    @ads = Ad.where('date >= ?', t)
    @count_ads = @ads.count
  end
  def vencidos
    if current_user.cargo==0
      t = Date.today()
      @ads = Ad.where('date < ?', t)
      @count_ads = @ads.count
    else
      redirect_to root_path, alert: "Debes ser administrador para esta acción."
    end
  end
  def show
    @question = Question.new
  end

  def new
    if current_user.cargo == 0
    @ad = Ad.new
    else
      redirect_to root_path, alert: "Para crear un nuevo aviso debes ser administrador."
    end
  end
  def create
    @ad = current_user.ads.new(ad_params)
    if @ad.save
      redirect_to ads_path
    else
      render :new
    end
  end
  def edit
    
  end
  def update
    
    if @ad.update(ad_params)
      redirect_to ads_path
    else
      render :edit
    end
    
  end
  def destroy
    @ad.destroy
    redirect_to ads_path, notice: "Aviso eliminado correctamente."
  end
  private
  def set_ads
    @ad = Ad.find(params[:id])
  end
  def validate_user
    redirect_to new_user_session_path, notice: "Necesitas iniciar sesión"
  end
  def ad_params
    params.require(:ad).permit(:title,:description,:date)
  end
end
