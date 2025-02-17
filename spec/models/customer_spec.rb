require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'relationships' do
    it { should belong_to :supermarket }
    it { should have_many :customer_items }
    it { should have_many(:items).through(:customer_items) }
  end

  it 'can calculate the total price of all of the items' do
    supermarket = Supermarket.create!(name: 'King Soopers', location: 'Colorado')
    customer_1 = supermarket.customers.create!(name: "Bryan Shears")
    item_1 = Item.create!(name: 'Oranges', price: 1)
    item_2 = Item.create!(name: 'Apples', price: 2)
    item_3 = Item.create!(name: 'Bread', price: 3)

    customer_item_1 = CustomerItem.create!(item_id: item_1.id, customer_id: customer_1.id)
    customer_item_2 = CustomerItem.create!(item_id: item_2.id, customer_id: customer_1.id)
    customer_item_3 = CustomerItem.create!(item_id: item_3.id, customer_id: customer_1.id)

    expect(customer_1.total_price).to eq(6)

  end
end
