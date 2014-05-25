require 'spec_helper'

describe 'cars CRUD' do
  it 'allows users to add, view, and update cars' do
    visit '/'

    click_link 'Cars'

    expect(page).to have_content 'Cars'

    click_link 'Add Car'

    click_button 'Create Car'

    expect(page).to have_content 'Make is required.'
    expect(page).to have_content 'Model is required.'
    expect(page).to have_content 'Year is required.'

    fill_in 'Make', with: 'Buick'
    fill_in 'Model', with: 'Grand National'
    fill_in 'Year', with: 1983
    select 'V6'
    check 'Turbocharged'

    click_button 'Create Car'

    expect(page).to have_content 'Cars'
    expect(page).to have_content 1983
    expect(page).to have_content 'V6'

    click_link 'Buick'

    expect(page).to have_content 'Grand National'
    expect(page).to have_content 'V6'

    click_link 'Edit'

    expect(page).to have_content 'Edit Car'
    fill_in 'Model', with: 'GNX'

    click_button 'Update Car'

    expect(page).to have_content 'GNX'
  end
end