require 'rails_helper'

describe "customer page", :type => :feature do
  before :each do
    @customer = create(:customer)
  end

  it "has a create order link" do
    visit "/customers/#{@customer.id}"
    expect(page).to have_link 'New Order'
  end
  it "initializes new order correctly" do
    visit "/customers/#{@customer.id}"
    click_link 'New Order'
    fill_in 'Status', with: :new
    fill_in 'Price', with: 10.0
    click_button 'Create Order'
    order = Order.last
    expect(order.customer).to eq @customer
  end
  it "has an order list" do
    visit "/customers/#{@customer.id}"
    @total_price = 0.0
    @customer.orders.each do |order|
     expect(page).to have_content order.id
     expect(page).to have_content order.placed_on
     expect(page).to have_content order.price
     expect(page).to have_content order.status
     
     @total_price = @total_price + order.price
    end
     expect(page).to have_content @total_price
  end
end
