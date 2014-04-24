require 'spec_helper'

feature 'bands' do
  scenario 'can create a band' do
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
  end
end