require 'rails_helper'

RSpec.describe Order, type: :model do
   costumer = FactoryBot.create(:costumer)
  subject { Order.new(product_name: "ball", product_count: 3, costumer_id: 1 )}


  it "is valid with valid attributes" do
    costumer = FactoryBot.create(:costumer)
    expect(subject).to be_valid
  end
  # if we set the first_name is not vaild then
  it "is not valid without a product_name" do
    subject.product_name=nil
    expect(subject).to_not be_valid
  end


  it "is not valid without a product_count" do
    subject.product_count=nil
    expect(subject).to_not be_valid
  end
    # if phoen number is not 10 characters
  it "is not valid without a costumer" do
    subject.costumer_id=nil
    expect(subject).to_not be_valid
  end

  it "is not valid if the product_count is not a number" do
    subject.product_count="a"
    expect(subject).to_not be_valid
  end





  #it "should not allow duplicate product names" do
  #  Order.create(product_name: " boots", product_count: 3, costumer: FactoryBot.create(:costumer))
  #  Order.create(product_name: " boots", product_count: 4, costumer: FactoryBot.create(:costumer))
  #  expect(Order.count).to eq 1
  #end

  #it "should return the costumer's name and product name and product count" do
  #  costumer=FactoryBot.create(:costumer)
  #  order= Order.create(product_name: " boots", product_count: 3, costumer: costumer)
  #  expect(order.to_s).to eq(costumer.full_name + "has ordered " + order.product_count.to_s + order.product_name)
  #end


end
