require 'rails_helper'

RSpec.describe 'roles#new' do
  it 'exists' do
    visit '/roles/new'
  end

  it 'has a form' do
    visit '/roles/new'
    expect(page).to have_css('form')
  end
end
