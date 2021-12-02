require 'rails_helper'

RSpec.describe 'Monsters pages', type: :feature do
  before :each do
    @level_1 = Level.create!(name: "Level 1", boss: false, difficulty: 1)
    @level_2 = Level.create!(name: "Level 2", boss: false, difficulty: 2)
    @level_3 = Level.create!(name: "Level 3", boss: true, difficulty: 3)

    @monster_1 = Monster.create!(name: "Monster_1", enraged: false, health: 10, level_id: @level_1.id)
    @monster_2 = Monster.create!(name: "Monster_2", enraged: true, health: 7, level_id: @level_1.id)
    @monster_3 = Monster.create!(name: "Monster_3", enraged: true, health: 8, level_id: @level_2.id)
    @monster_4 = Monster.create!(name: "Monster_4", enraged: false, health: 12, level_id: @level_2.id)
    @monster_5 = Monster.create!(name: "Monster_5", enraged: false, health: 11, level_id: @level_3.id)
    @monster_6 = Monster.create!(name: "Monster_6", enraged: true, health: 10, level_id: @level_3.id)
  end

  describe  'show page' do
    it "shows all the data related to corrosponding monster " do
      visit "/monsters/#{@monster_1.id}"

      expect(page).to have_content(@monster_1.level_id)
      expect(page).to have_content(@monster_1.name)
      expect(page).to have_content(@monster_1.enraged)
      expect(page).to have_content(@monster_1.health)
    end
  end
end
