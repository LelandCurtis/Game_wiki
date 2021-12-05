require 'rails_helper'

RSpec.describe 'Monsters creation' do
  before :each do
    @level_1 = Level.create!(name: "Level 1", boss: false, difficulty: 1)
    @monster_1 = @level_1.monsters.create!(name: "Monster_1", enraged: false, health: 10, level_id: @level_1.id)
    @monster_2 = @level_1.monsters.create!(name: "Monster_2", enraged: true, health: 7, level_id: @level_1.id)
  end
  it "links to the new page from the level_monsters index" do
    visit "/levels/#{@level_1.id}/monsters"
    click_link("New Monster")
    expect (current_path).to eq("/levels/#{@level_1.id}/monsters/new")
  end
end
