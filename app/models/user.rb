class User < ApplicationRecord
	acts_as_paranoid
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :shops, dependent: :destroy
  has_many :post_comments, dependent: :destroy #コメント機能
  has_many :favorites, through: :favorites, source: :shop #お気に入り,
    #has_many :favposts, through: :favorites, source: :shop #お気に入り


    validates :name, presence: true, uniqueness: true
    validates :email, uniqueness: true

  attachment :profile_image

end
