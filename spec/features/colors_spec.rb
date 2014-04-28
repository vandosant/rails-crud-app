require 'spec_helper'

feature 'color CRUD' do
  scenario 'users can add a color' do
    visit '/'

    click_link "Colors"

    expect(page).to have_content "Name"
    expect(page).to have_content "Primary?"
    expect(page).to have_content "Spectrum"


    click_link "Add Color"

    fill_in "name", with: "Yellow"
    check "primary"
    fill_in "spectrum", with: "Yellow"

    click_button "Add Color"

    expect(page).to have_content "Yellow"
    expect(page).to have_content "True"
    expect(page).to have_content "Yellow Spectrum"
  end

  scenario 'users see an error if form is incomplete' do
    visit '/'

    click_link "Colors"

    click_link "Add Color"

    fill_in "name", with: "Yellow"
    check "primary"

    click_button "Add Color"

    expect(page).to have_content "error"
  end
end