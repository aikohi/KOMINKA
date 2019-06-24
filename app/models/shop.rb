class Shop < ApplicationRecord
	def self.search(search)
      if search
        Shop.where(['address LIKE ?', "%#{search}%"])#titleの部分に検索したい部分一致のカラムを入れる
      else
        Shop.all.order(created_at: :desc)
      end
  end

  def within_box(distance, latitude, longitude)
        distance = distance
        center_point = [latitude, longitude]
        box = Geocoder::Calculations.bounding_box(center_point, distance)
        self.within_bounding_box(box)
  end

  geocoded_by :address       #GMAP
  after_validation :geocode, if: :address_changed?    #GMAP

	belongs_to :user
	attachment :shop_image
  has_many :post_comments, dependent: :destroy
  has_many :favorites, foreign_key: 'shop_id', dependent: :destroy #お気に入り
  has_many :users, through: :favorites #お気に入り

  with_options presence: true do
    validates :shop_name
    validates :introduction
    validates :first_menu
    validates :first_price
    validates :second_menu
    validates :second_price
    validates :start_time
    validates :last_time
    validates :holiday
    validates :address
    validates :phone_number
  end

end
