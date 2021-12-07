require 'rails_helper'

RSpec.describe Monster, type: :model do
  it {should belong_to :level}

  describe 'class methods' do
    before :each do
      @level_1 = Level.create!(name: "Level 1", boss: false, difficulty: 1)

      @monster_1 = Monster.create!(name: "Sad Vampire", enraged: false, health: 10, level_id: @level_1.id)
      @monster_2 = Monster.create!(name: "Hairless Werewolf", enraged: true, health: 7, level_id: @level_1.id)
      @monster_3 = Monster.create!(name: "Hungry Child", enraged: true, health: 8, level_id: @level_1.id)
      @monster_4 = Monster.create!(name: "Dirty Bubble", enraged: true, health: 12, level_id: @level_1.id)
    end

    it "returns the monsters that are enraged" do
      expected = [@monster_2, @monster_3, @monster_4]
      expect(Monster.enraged_monsters).to eq(expected)
    end
  end

  describe ' instance methods' do
  end
end
