require 'rails_helper'

RSpec.describe Monster, type: :model do
  it {should belong_to :level}
  # pending "add some examples to (or delete) #{__FILE__}"
end
