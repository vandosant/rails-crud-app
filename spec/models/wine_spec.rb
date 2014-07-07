require 'spec_helper'

describe Wine do
  it 'accepts wines with a name, style, color, and rating' do
    wine = Wine.new
    wine.name = 'Poison Okra'
    wine.style = 'Country'
    wine.color = 'Green'
    wine.rating = 77

    expect(wine.valid?).to eq true
  end

  it 'does not accept wines without a name' do
    wine = new_wine(:name => '')
    expect(wine.valid?).to eq false
  end

  it 'does not accept wines without a style' do
    wine = new_wine(:style => '')
    expect(wine.valid?).to eq false
  end

  it 'accepts wines with a rating between 0 and 100' do
    wine = new_wine(:rating => 0)
    expect(wine).to be_valid

    wine = new_wine(:rating => 100)
    expect(wine).to be_valid
  end

  it 'does not accept wines with a rating over 100' do
    wine = new_wine(:rating => 101)
    expect(wine).to_not be_valid
  end
end