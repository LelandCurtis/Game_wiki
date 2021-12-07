require 'rails_helper'

RSpec.describe Level, type: :model do
  it {should have_many :monsters}

  describe 'instance method' do
    before :each do
      @level_1 = Level.create!(name: "Level 1", boss: false, difficulty: 1)

      @monster_1 = Monster.create!(name: "Sad Vampire", enraged: false, health: 10, level_id: @level_1.id)
      @monster_2 = Monster.create!(name: "Hairless Werewolf", enraged: true, health: 7, level_id: @level_1.id)
      @monster_3 = Monster.create!(name: "Hungry Child", enraged: true, health: 8, level_id: @level_1.id)
      @monster_4 = Monster.create!(name: "Dirty Bubble", enraged: true, health: 12, level_id: @level_1.id)
      expected = [@monster_2, @monster_3]
    end

    it "sorts the level's monsters alphabetically" do
      expected = [@monster_4, @monster_2, @monster_3, @monster_1]
      expect(@level_1.monsters_by_name).to eq(expected)
    end
  end


end
