require 'spec_helper'

feature 'color CRUD' do
  scenario 'users can add and view a color' do
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
    expect(page).to have_content "Color successfully added"

    click_link "Yellow"

    expect(page).to have_content "Yellow"
    expect(page).to have_content "True"
    expect(page).to have_content "Yellow Spectrum"
    expect(page).to have_no_content "Add Color"
  end

  scenario 'users see an error if form is incomplete' do
    visit '/'

    click_link "Colors"

    click_link "Add Color"

    fill_in "name", with: ""
    check "primary"

    click_button "Add Color"

    expect(page).to have_content "A spectrum is required"
    expect(page).to have_content "A color is required"
  end
end