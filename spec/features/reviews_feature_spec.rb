require 'spec_helper'

describe 'Reviews' do

  describe 'form to add a new review' do

    it 'should create a new review' do
      Restaurant.create(name: 'Restaurant Cool',
                        description: 'Description for Restaurant Cool')

      visit restaurants_path
      within '.restaurants' do
        click_link 'Restaurant Cool'
      end
      click_link 'Review this restaurant'
      
      expect(page).to have_css('h1', 'Review Restaurant Cool')
      within '.new_review' do
        fill_in 'Comment', with: 'Review of Restaurant Cool'
        select '5', from: 'Rating'
        click_button 'Submit review'
      end

      expect(current_url).to eq url_for(Restaurant.last)
      within '.reviews' do
        expect(page).to have_css('.comment', text: 'Review of Restaurant Cool')
        expect(page).to have_css('.rating', text: '5')
      end
    end

  end

end