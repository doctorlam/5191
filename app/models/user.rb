class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true
  has_many :lessons, dependent: :destroy 
   has_many :projects, dependent: :destroy 
   has_many :abouts, dependent: :destroy
   has_many :submissions
   has_attached_file :avatar, :styles => { :medium => "150x150>", :thumb => "30x30" }, :default_url => "missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  acts_as_commontator
  has_many :posts
  has_many :responses


  
end
