require 'rails_helper'

 RSpec.describe 'levels pages', type: :feature do
   before :each do
     @level_1 = Level.create!(name: "Level 1", boss: false, difficulty: 1)
     @level_2 = Level.create!(name: "Level 2", boss: false, difficulty: 2)
     @level_3 = Level.create!(name: "Level 3", boss: true, difficulty: 3)
   end

   it "shows all the data related to corrosponding level " do
     visit "/levels/#{@level_1.id}"

     expect(page).to have_content(@level_1.name)
     expect(page).to have_content(@level_1.boss)
     expect(page).to have_content(@level_1.difficulty)
   end

   it "returns the number of monsters on a level" do
     visit "/levels/#{@level_1.id}"

     expect(page).to have_content(@level_1.monsters.count)
   end

   it 'has a link to the level_monsters index page' do
     visit "/levels/#{@level_1.id}"
     expect(page).to have_link("Monsters:")
     click_link "Monsters:"
     expect(current_path).to eq("/levels/#{@level_1.id}/monsters")
   end
   
   it "links to the edit page" do
     visit "/levels/#{@level_1.id}"
     click_button "Edit Level"
     expect(current_path).to eq("/levels/#{@level_1.id}/edit")
   end
 end
