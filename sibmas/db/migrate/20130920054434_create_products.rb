class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string  :name_ru
      t.string  :product_code
      t.float   :weight
      t.decimal :price, precision: 8, scale: 2
      t.decimal :list_price, precision: 8, scale: 2
      t.string  :slug
      t.text    :description_ru
      t.text    :meta_description_ru
      t.text    :meta_title_ru
      t.timestamps
    end
  end
end
