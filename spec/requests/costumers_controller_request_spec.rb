require 'rails_helper'

RSpec.describe "CostumersControllers", type: :request do

  describe "get costumers_path" do
    it "renders the index view" do #tests you have a route 200:  we found the reoute and th emethod in the controller
      FactoryBot.create_list(:costumer, 10)
      get costumers_path
      expect(response.status).to eq(200)
    end
  end
  describe "get costumer_path" do
    it "renders the :show template" do
      costumer = FactoryBot.create(:costumer)
      get costumer_path(id: costumer.id)
      expect(response.status).to eq(200)
    end

    it "redirects to the index path if the costumer id is invalid" do
      get costumer_path(id: 5000) #an ID that doesn't exist
      expect(response).to redirect_to costumers_path
    end
  end
  describe "get new_costumer_path" do
    #tests the new action for costumers controller
   it "renders the :new template" do #loadign a form and showing us that form, no need to access Database
     get new_costumer_path  #testing new costumer path, no need if costumer IF
     expect(response.status).to eq(200)
   end
 end
  describe "get edit_costumer_path" do
    it "renders the :edit template" do
     costumer = FactoryBot.create(:costumer)
     get edit_costumer_path(id: costumer.id)
     expect(response.status).to eq(200)
    end
  end
  describe "post costumers_path with valid data" do #we are going to do an update
    it "saves a new entry and redirects to the show path for the entry" do #csotumer has not been created
      costumer_attributes = FactoryBot.attributes_for(:costumer)#define costumer_attributes
      expect do
        post costumers_path, {costumer: costumer_attributes}
      end.to change(Costumer, :count).by 1   # expect(response).to redirect_to costumer_path(id: Costumer.last.id)
      expect(response.status).to eq(302)
      expect(response).to redirect_to costumer_path(id: Costumer.last)
    end
  end
  describe "post costumers_path with invalid data" do
    it "does not save a new entry or redirect" do
      costumer_attributes = FactoryBot.attributes_for(:costumer)#creating a hash of valid atributes fo r costumer
      costumer_attributes.delete(:first_name)#deleting costumer_first name
      expect { post costumers_path, {costumer: costumer_attributes}#first name is missing and Rails doe snot save it because of validation, first name is missing
      }.to_not change(Costumer, :count)
      expect(response.status).to eq(200)
    end
  end
  describe "put costumer_path with valid data" do #create
    it "updates an entry and redirects to the show path for the costumer" do
        #update whatever fields you want, make it as comprehensive as we want
      costumer = FactoryBot.create(:costumer, first_name: "James") #change something, like the first_nameexpect {put}
        expect(costumer.first_name).to eq("James")     # we are going to do an update, wo we need to have the costumer actually in the database if we are going to test that something alctually changed with the update
        patch costumer_path(costumer), {costumer: {first_name: "Bob"}}
        costumer.reload
        expect(costumer.first_name).to eq("Bob")   # id of costumer we created
      end
    end
  describe "put costumer_path with invalid data" do
    it "does not update the costumer record or redirect" do
    #we want to test updating a customer record, so first we have to create the record
     costumer = FactoryBot.create(:costumer)
     #put is the operation for update.  The route for update includes
     #the customer.id.  We attempt to update the customer record with
     #a phone number of "123" which is invalid
     put costumer_path(id: costumer.id), params: {costumer: { phone: "123"}}
     #we have to reload the customer object to see if what is in the database
     #has changed
     costumer.reload
     #we expect it not to change because the phone number is invalid
     expect(costumer.phone).to_not eq("123")
     #we don't expect a redirect, and therefore the HTTP status should be 200
     expect(response.status).to eq(200)

    end
  end

  describe "delete a costumer record" do
    it "deletes a costumer record" do
      costumer = FactoryBot.create(:costumer)
      #delete costumer_path(id: costumer.id) #delete is  the operation for destroy. The route for destroy includes the costumer.id
      expect { delete costumer_path(costumer.id) }.to change {Costumer.count}.from(1).to(0)
      #expect(costumer).to eq nil
      #expect {Costumer, :count}.to_not change
      #we don't expect a redirect, and therefore the HTTP status should be 200
      expect(response.status).to eq(302)

    end
  end

end
