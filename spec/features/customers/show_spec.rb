require 'rails_helper'

RSpec.describe 'customer show page' do
  it 'lists the customer items' do
    supermarket = Supermarket.create!(name: 'King Soopers', location: 'Colorado')
    customer_1 = supermarket.customers.create!(name: "Bryan Shears")
    item_1 = Item.create!(name: 'Oranges', price: 1)
    item_2 = Item.create!(name: 'Apples', price: 2)
    item_3 = Item.create!(name: 'Bread', price: 3)

    customer_item_1 = CustomerItem.create!(item_id: item_1.id, customer_id: customer_1.id)
    customer_item_2 = CustomerItem.create!(item_id: item_2.id, customer_id: customer_1.id)
    customer_item_3 = CustomerItem.create!(item_id: item_3.id, customer_id: customer_1.id)


    visit "/customers/#{customer_1.id}"
    # expect(page).to have_content("Bryan Shears")
    expect(page).to have_content('Oranges')
    expect(page).to have_content('Apples')
    expect(page).to have_content('Bread')
    expect(page).to have_content('King Soopers')
  end

end
