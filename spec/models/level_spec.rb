require 'rails_helper'

RSpec.describe Level, type: :model do
  it {should have_many :weapons}

  describe 'instance methods' do
    # before :each do
    #   @level_1 = Level.create!(name: "Level 1", boss: false, difficulty: 1)
    #   @level_2 = Level.create!(name: "Level 2", boss: false, difficulty: 2)
    # end
  end

end
