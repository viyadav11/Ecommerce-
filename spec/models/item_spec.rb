require 'rails_helper'

RSpec.describe Item, :type => :model do
  subject{Item.new(name:"Vikas",price:300,rating:4)}

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
   it "is not valid without a name"  do
  
  subject.name=nil
     expect(subject).to_not be_valid
   end
  it "is not valid without a price" do
    # subject.price=nil
    # expect(subject).to_not be_valid
  end  
  it "is rating should be in between 1-10" do
      subject.rating=30
      expect(subject).to be_valid
  end
end