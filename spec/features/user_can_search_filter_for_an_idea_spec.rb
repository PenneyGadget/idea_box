require 'rails_helper'

RSpec.describe "A user can case-insenstive search for an idea", type: :feature do
  scenario "the results are properly filterd", js: true do
    Idea.create({ title: "Sleep", body: "It's great" })
    Idea.create({ title: "Coffee", body: "After sleeping in." })
    Idea.create({ title: "Food", body: "Eat it" })

    visit root_path

    fill_in "search-box-field", with: "slee"

    expect(page).to_not have_content("Food")
    expect(page).to_not have_content("Eat it")

    expect(page).to have_content("Sleep")
    expect(page).to have_content("It's great")
    expect(page).to have_content("Coffee")
    expect(page).to have_content("After sleeping in.")
  end
end
