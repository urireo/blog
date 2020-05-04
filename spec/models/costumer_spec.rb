require 'rails_helper'

#RSpec.describe Costumer, type: :model do
#  pending "add some examples to (or delete) #{__FILE__}"

#end
RSpec.describe Costumer, type: :model do
  #subject is applicable to all the code bellow
  subject { Costumer.new(first_name: "Jack", last_name: "Smith", phone: "8889995678", email: "jsmith@sample.com" )}
 # we are testign the valid ? on the subject
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  # if we set the first_name is not vaild then
  it "is not valid without a first_name" do
    subject.first_name=nil
    expect(subject).to_not be_valid
  end


  it "is not valid without a last_name" do
    subject.last_name=nil
    expect(subject).to_not be_valid
  end
    # if phoen number is not 10 characters
  it "is not valid without a phone number" do
    subject.phone=nil
    expect(subject).to_not be_valid
  end

  it "is not valid without an email" do
    subject.email=nil
    expect(subject).to_not be_valid
  end

  it "is not valid if the phone number is not 10 chars" do
    subject.phone="456789"
    expect(subject).to_not be_valid
  end

  it "is not valid if the phone number is not all digits" do
      subject.phone="345698767D"
      expect(subject).to_not be_valid
  end

  it "is not valid if the email address doesn't have a @" do
    subject.phone="mary.pineda_gmail.com"
    expect(subject).to_not be_valid
  end
  it "returns the correct full_name" do
    expect(subject.full_name).to eq("Jack Smith")
  end
end
