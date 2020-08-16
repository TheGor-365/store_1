require 'spec_helper'

describe Order do
  it 'calculate the total price of the order' do
    item1 = FactoryBot.create(:item)
    item2 = FactoryBot.create(:item, prcie: 20)

    order = FactoryBot.create(:order)
    orders.items << item1
    orders.items << item2

    order.calculate_total
    expect(order.total).to eq(30)
  end

  it 'raises exeption if order has no items in it' do
    expect( -> { create(:order) }).to raise_exeption
  end
end
