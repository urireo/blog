require 'faker'
#FactoryBot.define do
#  factory :order do
#    product_name { "MyString" }
#    product_count { 1 }
#    costumer { 1}
#  end
#end




# this will generate as many sammpleas as we want
FactoryBot.define do
  factory :order do |f|
   f.product_name {"Hats"}
   f.product_count { 1 }
   f.costumer {Costumer.last.id}
  end
end
