require 'rails_helper'

describe "order list", :type => :feature do
  before :each do
    @customer = create(:customer_with_orders)
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
