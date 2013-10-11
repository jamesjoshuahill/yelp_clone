require 'spec_helper'

describe 'Restaurants' do
  
  describe 'form to add a new restaurant' do

    it 'should create a new Restaurant' do
      visit new_restaurant_path
      expect(page).to have_css('h1', text: 'Add new restaurant')

      within '.new_restaurant' do
        fill_in 'Name', with: 'New Restaurant'
        fill_in 'Description', with: 'Description for New Restaurant'
        click_button 'Add new restaurant'
      end

      expect(current_url).to eq url_for(Restaurant.last)
      expect(page).to have_css('.name', text: 'New Restaurant')
      expect(page).to have_css('.description', text: 'Description for New Restaurant')
    end

  end

end