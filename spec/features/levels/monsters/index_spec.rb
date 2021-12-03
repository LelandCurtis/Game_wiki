require 'rails_helper'

RSpec.describe 'Levels monsters index' do
  before :each do
    @level_1 = Level.create!(name: "Level 1", boss: false, difficulty: 1)
    @level_2 = Level.create!(name: "Level 2", boss: false, difficulty: 2)
    @level_3 = Level.create!(name: "Level 3", boss: true, difficulty: 3)

    @monster_1 = @level_1.monsters.create!(name: "Monster_1", enraged: false, health: 10, level_id: @level_1.id)
    @monster_2 = @level_1.monsters.create!(name: "Monster_2", enraged: true, health: 7, level_id: @level_1.id)
    @monster_3 = @level_2.monsters.create!(name: "Monster_3", enraged: true, health: 8, level_id: @level_2.id)
    @monster_4 = @level_2.monsters.create!(name: "Monster_4", enraged: false, health: 12, level_id: @level_2.id)
    @monster_5 = @level_3.monsters.create!(name: "Monster_5", enraged: false, health: 11, level_id: @level_3.id)
    @monster_6 = @level_3.monsters.create!(name: "Monster_6", enraged: true, health: 10, level_id: @level_3.id)
  end

  it ' shows all the monsters in a level' do
   visit "/levels/#{@level_1.id}/monsters"

   expect(page).to have_content(@monster_1.name)
   expect(page).to have_content(@monster_2.name)

  end

  xit ' links to each monster page' do
   visit "/levels/#{@level_1.id}/monsters"

   click_on @monster_1.name

   expect(current_path).to eq("/levels/#{@monster_1.id}")
  end
end
