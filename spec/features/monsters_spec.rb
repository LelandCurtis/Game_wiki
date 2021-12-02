require 'rails_helper'

RSpec.describe 'Monsters pages', type: :feature do
  before :each do
    @monster_1 = Monster.create!(level_id: 1, name: "Monster_1", enraged: false, health: 10)
    @monster_2 = Monster.create!(level_id: 1, name: "Monster_2", enraged: true, health: 7)
    @monster_3 = Monster.create!(level_id: 2, name: "Monster_3", enraged: true, health: 8)
    @monster_3 = Monster.create!(level_id: 2, name: "Monster_4", enraged: false, health: 12)
    @monster_4 = Monster.create!(level_id: 3, name: "Monster_5", enraged: false, health: 11)
    @monster_4 = Monster.create!(level_id: 3, name: "Monster_6", enraged: true, health: 10)
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
