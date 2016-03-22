require 'rails_helper'

RSpec.describe "A user can delete an idea", type: :feature do
  scenario "the bad idea is removed from all the things", js: true do
    idea1 = create(:idea)
    idea2 = create(:idea)

    visit root_path

    within "#latest-ideas:nth-of-type(1)" do
      page.find("#delete-idea").click
    end

    sleep(2)

    expect(Idea.count).to eq(1)

    expect(page).to_not have_content(idea2.title)
    expect(page).to_not have_content(idea2.body)
    expect(page).to_not have_content(idea2.quality)

    expect(page).to have_content(idea1.title)
    expect(page).to have_content(idea1.body)
    expect(page).to have_content(idea1.quality)
  end
end
