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
end