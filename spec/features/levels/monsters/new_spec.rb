require 'rails_helper'

RSpec.describe 'Monsters creation' do
  before :each do
    @level_1 = Level.create!(name: "Level 1", boss: false, difficulty: 1)
    @monster_1 = @level_1.monsters.create!(name: "Monster_1", enraged: false, health: 10, level_id: @level_1.id)
    @monster_2 = @level_1.monsters.create!(name: "Monster_2", enraged: true, health: 7, level_id: @level_1.id)
  end
  xit "links to the new page from the level_monsters index" do
    visit "/levels/#{@level_1.id}/monsters"
    click_link("New Monster")
    expect (current_path).to eq("/levels/#{@level_1.id}/monsters/new")
  end

  xit "can create a new monster" do
    visit "/levels/#{@level_1.id}/monsters/new"

    fill_in('Name', with: "Monster_4")
    select("True", from: 'Enraged')
    fill_in('Health', with: 34)
    click_button('Create Monster')

    expect(current_path).to eq("/levels/#{@level_1.id}/monsters")
    expect(page).to have_content("Monster_4")
  end
end
