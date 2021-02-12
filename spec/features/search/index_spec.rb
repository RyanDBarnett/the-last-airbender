require 'rails_helper'

RSpec.describe 'As a user' do
  describe "When I am taken to '/search' after performing a 'Fire Nation' search" do
    it "Then I should see the total number of people who live in the Fire Nation." do
      visit root_path

      select 'Fire Nation', from: :nation

      click_button 'Search For Members'

      expect(page).to have_content("Total Members in Fire Nation: 97")
    end

    describe 'I should see a list of members of the Fire Nation.' do
      it 'the list should only be 25 members' do
        visit root_path

        select 'Fire Nation', from: :nation

        click_button 'Search For Members'

        expect(page).to have_css('.member', count: 25)
      end

      describe 'For each of the members I should see:' do
        it 'the name of the member' do
          visit root_path

          select 'Fire Nation', from: :nation

          click_button 'Search For Members'

          expect(find(".member", match: :first)).to have_content("Name: Afiko")
        end

        it 'an image for the member' do
          visit root_path

          select 'Fire Nation', from: :nation

          click_button 'Search For Members'

          expect(find(".member", match: :first)).to have_selector('img')
        end
      end
    end
  end
end
