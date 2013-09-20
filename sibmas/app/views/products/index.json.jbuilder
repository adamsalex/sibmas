json.array!(@products) do |product|
  json.extract! product, :name_ru, :product_code, :weight, :price, :list_price, :slug, :description_ru, :meta_description_ru, :meta_title_ru
  json.url product_url(product, format: :json)
end
