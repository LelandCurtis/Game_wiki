# require 'rails_helper'
#
# RSpec.describe 'Levels monster index' do
#   before :each do
#     @level_1 = Level.create!(name: "Level 1", boss: false, difficulty: 1)
#     @monster_1 = Monster.create!(level_id: 1, name: "Monster_1", enraged: false, health: 10)
#     @monster_2 = Monster.create!(level_id: 1, name: "Monster_2", enraged: true, health: 7)
#   end
#
#   it ' shows all the monsters in a level' do
#    visit "/levels/#{@level_1.id}/monsters"
#
#    expect(page).to have_content(@monster_1.title)
#    expect(page).to have_content(@monster_2.title)
#
#   end
#
#   it ' links to each monster page'
#    visit "/levels/#{@level_1.id}/monsters"
#
#    click_on @monster_1.name
#
# expect(current_path).to eq("/songs/#{monster_1.id}")
# end
