require 'rails_helper'

RSpec.describe 'roles#new' do
  it 'exists' do
    visit '/roles/new'
  end

  it 'has a form' do
    visit '/roles/new'
    expect(page).to have_css('form')
  end

  it 'has text input field for name' do
    visit '/roles/new'
    expect(page.find('input#name').visible?).to eq(true)
    fill_in "name", with: 'New Role'
    expect(page).to have_field('name', with: 'New Role')
  end

  it 'has radio input field for unlocked' do
    visit '/roles/new'
    expect(page.find('select#unlocked').visible?).to eq(true)
    select "True", from: 'unlocked'
    expect(page).to have_field('unlocked', with: 'true')
  end

  it 'has a submit button' do

  end
end
