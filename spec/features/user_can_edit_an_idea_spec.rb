require 'rails_helper'

RSpec.describe "A user can update an idea", type: :feature do
  scenario "the idea is rendered with the updated values", js: true do
    Idea.create({ title: "Soup", body: "Yum!"})

    visit root_path

    click_on("Edit")
    fill_in "new-idea-title", with: "Bacon"
    fill_in "new-idea-description", with: "Is even better!"
    click_on "Save this new better version"

    sleep(2)

    expect(page).to_not have_content("Soup")
    expect(page).to_not have_content("Yum!")

    expect(page).to have_content("Bacon")
    expect(page).to have_content("Is even better!")
  end
end
