class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true
  has_many :lessons, dependent: :destroy 
   has_many :projects, dependent: :destroy 
   has_many :abouts, dependent: :destroy

  acts_as_commontator

end
