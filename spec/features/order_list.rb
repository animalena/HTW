require 'rails_helper'

describe "the order overview", :type => :feature do
  before :each do
    @customer = create(:customer)
    visit "/customers/#{@customer.id}"
    click_link 'New Order'
    fill_in 'Status', with: :new
    click_button 'Create Order'
    order = Order.last
  end

it "has a create order link" do
    visit "/customers/#{@customer.id}"
   expect(page).to have_content order
  end
 
end
