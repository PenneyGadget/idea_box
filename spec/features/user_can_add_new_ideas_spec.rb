require 'rails_helper'

RSpec.describe "User can add a new idea", type: :feature do
  scenario "new idea is saved and renders on page", js: true do
    visit root_path

    fill_in "idea-title", with: "New Idea!"
    fill_in "idea-description", with: "The best one ever!!"
    click_on "save this idea"

    sleep(2)

    expect(Idea.count).to eq(1)
    expect(page).to have_content "New Idea!"
    expect(page).to have_content "The best one ever!!"
    expect(page).to have_content "his idea is: swill"
  end

  scenario "text fields are cleared after creating an idea", js: true do
    visit root_path

    fill_in "idea-title", with: "New Idea!"
    fill_in "idea-description", with: "The best one ever!!"
    click_on "save this idea"

    sleep(2)

    within "#idea-title" do
      expect(page).to have_content("")
    end

    within "#idea-description" do
      expect(page).to have_content("")
    end
  end

  scenario "newest ideas are at the top of the list", js: true do
    visit root_path

    fill_in "idea-title", with: "First idea"
    fill_in "idea-description", with: "Idea numero uno"
    click_on "save this idea"

    sleep(2)

    fill_in "idea-title", with: "Second idea"
    fill_in "idea-description", with: "I should be on top"
    click_on "save this idea"

    sleep(2)

    within "#latest-ideas:nth-of-type(1)" do
      expect(page).to have_content("Second idea")
      expect(page).to have_content("I should be on top")
    end
  end

  scenario "idea descriptions longer than 100 characters are truncated", js: true do
    visit root_path

    fill_in "idea-title", with: "Reuse"
    fill_in "idea-description", with: "In the recycling model of 'reduce, reuse, " \
                                       "recycle' this is really the most important " \
                                       "component because it's the only one that " \
                                       "addresses the issue of overconsumption."
    click_on "save this idea"

    sleep(2)

    expect(page).to have_content("In the recycling model of 'reduce, reuse, " \
                                  "recycle' this is really the most important " \
                                  "component...")
  end
end
