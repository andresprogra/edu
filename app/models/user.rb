class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :ads
  has_many :questions
  validates :name, presence: true
  validates :apellido, presence: true
  validates :semestre, presence: true
  validates :email, presence: true
  validates :grupo, presence: true

  def update_puntos
  	self.update(puntos: self.puntos + 1)
  end
end
