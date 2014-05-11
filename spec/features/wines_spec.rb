require 'spec_helper'

feature 'wine CRUD' do
  scenario 'users can add and view a wine' do
    visit '/'

    click_link 'Wines'

    click_link 'New wine'

    fill_in 'wine_name', with: 'Thousand Oaks Reserve'
    fill_in 'wine_style', with: 'Cabernet'
    fill_in 'wine_color', with: 'Red'
    fill_in 'wine_rating', with: 92

    click_button 'Create'

    expect(page).to have_content 'Thousand Oaks Reserve'
    expect(page).to have_content 'Cabernet'
    expect(page).to have_content 92

    click_link 'Thousand Oaks Reserve'

    expect(page).to have_content 'Thousand Oaks Reserve'
    expect(page).to have_content 'Cabernet'
    expect(page).to have_content 92
  end

  scenario 'users see errors for new wines without names or styles' do
    visit '/'

    click_link 'Wines'

    click_link 'New wine'

    fill_in 'wine_name', with: ''
    fill_in 'wine_style', with: ''
    fill_in 'wine_color', with: 'Red'
    fill_in 'wine_rating', with: 92

    click_button 'Create'

    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Style can't be blank"
  end
end