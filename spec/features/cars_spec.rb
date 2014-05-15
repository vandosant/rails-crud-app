require 'spec_helper'

describe 'cars CRUD' do
  it 'allows users to add and view cars' do
    visit '/'

    click_link 'Cars'

    expect(page).to have_content 'Cars'

    click_link 'Add Car'

    fill_in 'Make', with: 'Buick'
    fill_in 'Model', with: 'Grand National'
    fill_in 'Year', with: 1983
    select 'V6'
    check 'Turbocharged'

    click_button 'Add'

    expect(page).to have_content 'Cars'
    expect(page).to have_content 1983
    expect(page).to have_content 'True'

    click_link 'Buick'

    expect(page).to have_content 'Grand National'
    expect(page).to have_content 'V6'
  end
end