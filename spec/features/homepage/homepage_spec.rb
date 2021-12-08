require 'rails_helper'

RSpec.describe 'homepage' do
  it 'displays a welcome message and links on path /' do
    visit '/'
    expect(page).to have_content("Welcome to our Game Wiki")
  end
end
