require 'rails_helper'

RSpec.describe "OrdersControllers", type: :request do

  subject { Order.new(product_name: "ball", product_count: 3, costumer_id: 2 )}

#  describe "get orders_path" do
#    it "renders the index view" do #tests you have a route 200:  we found the reoute and th emethod in the controller
#      FactoryBot.create_list(:order, 10)
#      get orders_path
#      expect(response.status).to eq(200)
#    end
#  end

#  describe "get order_path" do
#    it "renders the :show template" do
#      order = FactoryBot.create(:order)
#      get order_path(id: order.id)
#      expect(response.status).to eq(200)
#    end
#    it "redirects to the index path if the order id is invalid" do
#      get order_path(id: 5000) #an ID that doesn't exist
#      expect(response).to redirect_to orders_path
#    end
#  end



#  describe 'POST /orders' do
#    it "should create an order" do
#      data ={
#        product_count: 10,
#        product_name: 'Ham',
#        costumer_id: 5
#      }
#      expect(Order.count).to eq(0)
#      post orders_url, params: { order: data }
#      expect(Order.count).to eq(1)
#    end
#  end



  it "should have a costumer" do
    order=Order.new(product_name: " boots", product_count: 3)
    order.save
    expect(Order.count).to eq 0
  end


end
