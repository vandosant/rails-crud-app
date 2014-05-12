require 'spec_helper'

feature 'wine CRUD' do
  scenario 'users can add, view, edit, and delete wines' do
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

    click_link 'Edit'

    expect(page).to have_field('Name', with: 'Thousand Oaks Reserve')
    expect(page).to have_field('Style', with: 'Cabernet')
    fill_in 'wine_rating', with: 90
    fill_in 'wine_color', with: 'Purple'

    click_button 'Update'

    expect(page).to have_content 'Cabernet'
    expect(page).to have_content 90
    expect(page).to have_content 'Purple'

    click_link 'Thousand Oaks Reserve'

    click_link 'Edit'

    click_button 'Delete'

    expect(page).to have_no_content 'Cabernet'
    expect(page).to have_no_content 'Purple'
    expect(page).to have_content 'Wines'
    expect(page).to have_link 'New wine'
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