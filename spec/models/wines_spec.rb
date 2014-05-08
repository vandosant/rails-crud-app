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
    wine = Wine.new
    wine.name = ''
    wine.style = 'Country'
    wine.color = 'Green'
    wine.rating = 77

    expect(wine.valid?).to eq false
  end

  it 'does not accept wines without a style' do
    wine = Wine.new
    wine.name = 'Poison Okra'
    wine.style = ''
    wine.color = 'Green'
    wine.rating = 77

    expect(wine.valid?).to eq false
  end
end