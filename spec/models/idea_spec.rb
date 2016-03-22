require 'rails_helper'

RSpec.describe Idea, type: :model do
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:body) }

  it 'creates idea successfully' do
    idea = create(:idea)

    expect(idea).to be_valid
    expect(idea[:title]).to eq(idea.title)
    expect(idea[:body]).to eq(idea.body)
    expect(idea.quality).to eq 0
  end

  it 'requires a title' do
    idea = Idea.create(body: "Great idea!")

    expect(idea).to_not be_valid
    expect(Idea.count).to eq(0)
  end

  it 'requires a body' do
    idea = Idea.create(title: "Idea!")

    expect(idea).to_not be_valid
    expect(Idea.count).to eq(0)
  end
end
