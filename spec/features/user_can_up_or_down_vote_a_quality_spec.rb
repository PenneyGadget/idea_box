require 'rails_helper'

RSpec.describe "User can vote on the quality of an idea" do
  scenario "user clicks thumbs up", js: true do
    create(:idea)

    visit root_path

    page.find("#upvote-idea").click
    expect(page).to have_content("plausible")

    page.find("#upvote-idea").click
    expect(page).to have_content("genius")
  end

  scenario "user clicks thumbs down", js: true do
    create(:idea, quality: 2)

    visit root_path

    page.find("#downvote-idea").click
    expect(page).to have_content("plausible")

    page.find("#downvote-idea").click
    expect(page).to have_content("swill")
  end
end
