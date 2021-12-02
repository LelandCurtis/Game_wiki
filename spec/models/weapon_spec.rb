require 'rails_helper'

RSpec.describe Weapon, type: :model do
  it {should belong_to :role}

  describe 'instance methods' do

  end
end
