require 'rails_helper'

RSpec.describe 'monsters edit' do
  before :each do
    @level_1 = Level.create!(name: "Level 1", boss: false, difficulty: 1)

    @monster_1 = Monster.create!(name: "Monster_1", enraged: false, health: 10, level_id: @level_1.id)
    @monster_2 = Monster.create!(name: "Monster_2", enraged: true, health: 7, level_id: @level_1.id)
  end

  it "links to the edit page" do
    visit "/monsters/#{@monster_1.id}"
    click_button "Edit Monster"
    expect(current_path).to eq("/monsters/#{@monster_1.id}/edit")
  end

  xit "can edit the levels" do
    visit "/monsters/#{@monster_1.id}/edit"

    fill_in('Name', with: "Monster_12")
    fill_in('Health', with: 34)
    select("True", from: 'Enraged')
    click_button('Update Monster')

    expect(current_path).to eq("/monsters/#{@monster_1.id}")
    expect(page).to have_content("Monster_12")
    expect(page).to have_content(true)
    expect(page).to have_content(34)
  end
end
