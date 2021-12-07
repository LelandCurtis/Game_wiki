require 'rails_helper'

RSpec.describe 'Levels monsters index' do
  before :each do
    @level_1 = Level.create!(name: "Level 1", boss: false, difficulty: 1)
    @level_2 = Level.create!(name: "Level 2", boss: false, difficulty: 2)
    @level_3 = Level.create!(name: "Level 3", boss: true, difficulty: 3)

    @monster_1 = @level_1.monsters.create!(name: "6", enraged: false, health: 10, level_id: @level_1.id)
    @monster_2 = @level_1.monsters.create!(name: "5", enraged: true, health: 7, level_id: @level_1.id)
    @monster_3 = @level_2.monsters.create!(name: "4", enraged: true, health: 8, level_id: @level_2.id)
    @monster_4 = @level_2.monsters.create!(name: "3", enraged: false, health: 12, level_id: @level_2.id)
    @monster_5 = @level_3.monsters.create!(name: "2", enraged: false, health: 11, level_id: @level_3.id)
    @monster_6 = @level_3.monsters.create!(name: "1", enraged: true, health: 10, level_id: @level_3.id)
  end

  it 'routes properly' do
    visit "/levels/#{@level_1.id}/monsters"
  end

  it ' shows all the monsters in a level' do
   visit "/levels/#{@level_1.id}/monsters"

   expect(page).to have_content(@monster_1.name)
   expect(page).to have_content(@monster_2.name)
  end

  it "links to the edit page" do
    visit "/monsters/#{@monster_1.id}"
    click_button "Edit Monster"
    expect(current_path).to eq("/monsters/#{@monster_1.id}/edit")
  end

  it 'has link to sort index page' do
    visit "/levels/#{@level_1.id}/monsters"
    name_1 = @monster_1.name
    name_2 = @monster_2.name
    expect(name_1).to appear_before(name_2, only_text: true)
    click_link "Sort Index"
    expect(name_2).to appear_before(name_1, only_text: true)
  end

end
