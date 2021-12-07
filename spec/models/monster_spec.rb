require 'rails_helper'

RSpec.describe Monster, type: :model do
  it {should belong_to :level}

  describe 'class methods' do

  end

  describe ' instance methods' do
    before :each do
      @level_1 = Level.create!(name: "Level 1", boss: false, difficulty: 1)

      @monster_1 = Monster.create!(name: "Vampire", enraged: false, health: 10, level_id: @level_1.id)
      @monster_2 = Monster.create!(name: "Monster_2", enraged: true, health: 7, level_id: @level_1.id)
      @monster_3 = Monster.create!(name: "Monster_3", enraged: true, health: 8, level_id: @level_1.id)
      @monster_4 = Monster.create!(name: "Monster_4", enraged: false, health: 12, level_id: @level_1.id)
    end

    it "returns the monsters that are enraged" do
      expected = [@monster_2, @monster_3]
      expect(@level_1.monsters.enraged).to eq(expected)
    end

    it "text" do

    end
  end
end
