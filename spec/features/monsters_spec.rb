require 'rails_helper'

RSpec.describe 'Monsters pages', type: :feature do
  before :each do
    @level_1 = Level.create!(name: "Level 1", boss: false, difficulty: 1)
    @level_2 = Level.create!(name: "Level 2", boss: false, difficulty: 2)
    @level_3 = Level.create!(name: "Level 3", boss: true, difficulty: 3)

    @monster_1 = Monster.create!(name: "Monster_1", enraged: false, health: 10, level_id: @level_1)
    @monster_2 = Monster.create!(name: "Monster_2", enraged: true, health: 7, level_id: @level_1)
    @monster_3 = Monster.create!(name: "Monster_3", enraged: true, health: 8, level_id: @level_2)
    @monster_4 = Monster.create!(name: "Monster_4", enraged: false, health: 12, level_id: @level_2)
    @monster_5 = Monster.create!(name: "Monster_5", enraged: false, health: 11, level_id: @level_3)
    @monster_6 = Monster.create!(name: "Monster_6", enraged: true, health: 10, level_id: @level_3)
  end

  describe 'index page' do
    it "list all the monsters" do
      visit '/monsters'

      expect(page).to have_content('Monsters')
      expect(page).to have_content(@monster_1.name)
      expect(page).to have_content(@monster_2.name)
      expect(page).to have_content(@monster_3.name)
      expect(page).to have_content(@monster_4.name)
      expect(page).to have_content(@monster_5.name)
      expect(page).to have_content(@monster_6.name)
    end
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
