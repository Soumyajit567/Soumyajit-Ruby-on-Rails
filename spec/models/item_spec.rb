require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:item) { Item.create(name: 'Test Item') }

  it 'soft deletes an item' do
    item.soft_delete
    expect(Item.unscoped.where(id: item.id)).not_to be_empty
    expect(Item.all).not_to include(item)
  end

  it 'restores a soft-deleted item' do
    item.soft_delete
    item.restore
    expect(Item.all).to include(item)
  end

  it 'excludes soft-deleted items from normal queries' do
    item.soft_delete
    expect(Item.all).to be_empty
  end
end











