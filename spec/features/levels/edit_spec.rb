require 'rails_helper'

RSpec.describe 'levels edit' do
  before :each do
    @level_1 = Level.create!(name: "Level 1", boss: false, difficulty: 1)
  end

  it "links to the edit page" do
    visit "/levels/#{@level_1.id}"
    click_button "Edit Level"
    expect(current_path).to eq("/levels/#{@level_1.id}/edit")
  end

  it "can edit the levels" do
    visit "/levels/#{@level_1.id}/edit"

    fill_in('Name', with: "Level_7")
    fill_in('Difficulty', with: 20)
    select("True", from: 'Boss')
    click_button('Update Level')

    expect(current_path).to eq("/levels/#{@level_1.id}")
    expect(page).to have_content("Level_7")
    expect(page).to have_content(true)
    expect(page).to have_content(20)
  end
end
