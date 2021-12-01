require 'rails_helper'

 RSpec.describe 'levels pages', type: :feature do
   before :each do
     @level_1 = Level.create!(name: "Level 1", boss: false, difficulty: 1)
     @level_2 = Level.create!(name: "Level 2", boss: false, difficulty: 2)
     @level_3 = Level.create!(name: "Level 3", boss: true, difficulty: 3)
   end

   describe 'index page' do
    it "list all the levels" do
      visit '/levels'

      expect(page).to have_content('Levels')
      expect(page).to have_content(@level_1.name)
      expect(page).to have_content(@level_2.name)
      expect(page).to have_content(@level_3.name)
    end
  end

  describe 'details page' do
    it "shows all the data related to corrosponding level " do
      visit "/levels/#{@level_1.id}"

      expect(page).to have_content(@level_1.name)
      expect(page).to have_content(@level_1.boss)
      expect(page).to have_content(@level_1.difficulty)
      # expect(page).to have_content(@level_1.created_at)
      # expect(page).to have_content(@level_1.updated_at)
    end
  end

 end
