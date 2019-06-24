class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.string 	:shop_name
      t.string 	:introduction
      t.string 	:first_menu
      t.integer :first_price
      t.string 	:second_menu
      t.integer :second_price
      t.string	:start_time
      t.string	:last_time
      t.string	:holiday
      t.string	:address
      t.integer	:phone_number
      t.string	:shop_image_id
      t.integer	:user_id
      t.datetime	:deleted_at

      t.timestamps
    end
  end
end
