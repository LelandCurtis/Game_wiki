require 'rails_helper'

 RSpec.describe 'levels pages', type: :feature do
   before :each do
     @level_1 = Level.create!(name: "Level 1", boss: false, difficulty: 1)
     @level_2 = Level.create!(name: "Level 2", boss: false, difficulty: 2)
     @level_3 = Level.create!(name: "Level 3", boss: true, difficulty: 3)
   end

  it "list all the levels" do
    visit '/levels'

    expect(page).to have_content('Levels')
    expect(page).to have_content(@level_1.name)
    expect(page).to have_content(@level_2.name)
    expect(page).to have_content(@level_3.name)
  end

  it 'deletes and reorders the levels for the test' do
    visit '/levels'
    Level.destroy(@level_2.id)
    @level_2 = Level.create!(name: "Level 2", boss: false, difficulty: 2)
    visit current_path
    level_1_name = @level_1.name
    level_2_name = @level_2.name
    level_3_name = @level_3.name
    expected = [level_1_name, level_3_name, level_2_name]
    expect(page.all(:css, 'h3').map(&:text).split('\n')[0]).to eq(expected)
  end

  it 'shows that the page is showing the created_at times' do
    visit '/levels'
    expect(page).to have_content(@level_1.created_at)
    expect(page).to have_content(@level_2.created_at)
    expect(page).to have_content(@level_3.created_at)
  end

  it "links to the edit page" do
    visit "/levels/#{@level_1.id}"
    click_button "Edit Level"
    expect(current_path).to eq("/levels/#{@level_1.id}/edit")
  end
 end
