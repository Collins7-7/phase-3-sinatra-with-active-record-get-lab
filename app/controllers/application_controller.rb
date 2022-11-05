class ApplicationController < Sinatra::Base

  # add routes
  set :default_content_type, "application/json"
  get '/bakeries' do
    bakery = Bakery.all
    bakery.to_json
  end

  get '/bakeries/:id' do
    bakery = Bakery.find(params[:id])
    bakery.to_json(include: :baked_goods)

  end

get '/baked_goods/by_price' do
  backed_goods = BakedGood.all.order(price: :desc)
  backed_goods.to_json
end

get '/baked_goods/most_expensive' do
  baked_good = BakedGood.all.order(price: :desc)
  most_expensive = baked_good.map do |good|
    good
  end.first
  most_expensive.to_json
end

end

