require 'rails_helper'

RSpec.describe "Items", type: :request do
#   let(:item) {create :item}
#   before(:each) do
#     sign_in(item)
#   end
  describe "Rspecs of all Item Controller" do
    let(:item1) { { :name => "Cloths", :price => 30, :rating =>8 } }
    it "get response from Item index and redirect it to index action" do
        byebug
        get items_path
        # Item.create! item1
        
        expect(response).to be_successful
    
  end
#   describe 'Create Item' do
#     it "should render the new item and save in DB"
#     byebug
#     get :index
#     expect(response).to render_template('items/index')
# end
end

