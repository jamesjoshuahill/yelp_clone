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

  describe 'restaurants section' do

    before(:all) do
      Restaurant.create(name: 'New Restaurant', description: 'Description for New Restaurant')
      Restaurant.create(name: 'Another Restaurant', description: 'Description for Another Restaurant')
    end

    it 'should list all restaurants' do
      visit restaurants_path

      expect(page).to have_css('h1', text: 'All restaurants')
      within '.restaurants' do
        expect(page).to have_css('.name', text: 'New Restaurant')
        expect(page).to have_css('.name', text: 'Another Restaurant')
      end
    end

    it 'should have a page for each restaurant' do
      visit restaurants_path

      within '.restaurants' do
        click_link 'New Restaurant'
      end

      expect(current_url).to eq url_for(Restaurant.first)
      expect(page).to have_css('.name', text: 'New Restaurant')
      expect(page).to have_css('.description', text: 'Description for New Restaurant')
    end

  end

end