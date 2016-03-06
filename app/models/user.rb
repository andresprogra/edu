class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :ads
  has_many :questions
  validates :name, presence: true, :on => :update
  validates :apellido, presence: true, :on => :update
  validates :semestre, presence: true, :on => :update
  validates :email, presence: true, :on => :update
  validates :grupo, presence: true, :on => :update

  def update_puntos
  	self.update(puntos: self.puntos + 1)
  end
end
