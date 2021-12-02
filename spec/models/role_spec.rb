require 'rails_helper'

RSpec.describe Role, type: :model do
  it {should have_many :weapons}

  describe 'instance methods' do
    
  end
  # pending "add some examples to (or delete) #{__FILE__}"
end
