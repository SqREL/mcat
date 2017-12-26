require 'rails_helper'

describe CatsPrice::Shops do
  it 'should return array with shops' do
    expect(described_class.list).to be_a(Array)
  end
end
