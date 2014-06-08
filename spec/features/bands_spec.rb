require 'spec_helper'

feature 'bands' do
  scenario 'can create, view, edit, and delete a band' do
    visit '/'

    click_link "Bands"
    click_link "Create"

    fill_in "name", with: "MWRH"
    fill_in "genre", with: "Punk"
    fill_in "members", with: 4

    click_button "Create Band"

    expect(page).to have_content "MWRH"
    expect(page).to have_content "Punk"
    expect(page).to have_content 4

    click_link "MWRH"

    expect(page).to have_no_content "Create Band"

    click_link "Edit"

    fill_in "name", with: "Mountain Warfare Ready Heroes"
    fill_in "genre", with: "Ska"
    fill_in "members", with: 6

    click_button "Update Band"

    expect(page).to have_content "Mountain Warfare Ready Heroes"
    expect(page).to have_content "Ska"
    expect(page).to have_content 6
    expect(page).to have_no_content "MWRH"

    click_link "Mountain Warfare Ready Heroes"

    click_link "Edit"

    click_button "Delete"

    expect(page).to have_no_content "Mountain Warfare Ready Heroes"
    expect(page).to have_no_content "Ska"
    expect(page).to have_no_content 6
  end

  scenario 'can create instruments for the band' do
    band = Band.create!(name: "Special Riders", genre: "Blues", members: 4)

    visit '/'

    click_link "Bands"

    click_link "Special Riders"

    click_link "Instruments"

    expect(page).to have_content 'Instruments'

    click_link "Add Instrument"

    select 'Electric Guitar'
    fill_in 'Manufacturer', with: 'Fender'
    fill_in 'Model', with: 'Telecaster'
    select 1977
    fill_in 'Color', with: 'Yellow'
    click_button 'Add Instrument'

    expect(page).to have_content 'Instruments'
    expect(page).to have_content 'Telecaster'
    expect(page).to have_content '1977'
    expect(page).to have_content 'Yellow'
  end
end