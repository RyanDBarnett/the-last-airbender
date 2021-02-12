require 'rails_helper'

RSpec.describe 'As a user' do
  describe "When I visit '/' (welcome page)" do
    describe "And I Select 'Fire Nation' from the select field" do
      describe "And I click 'Search For Members'" do
        it "Then I should be on page '/search'" do
          visit root_path

          select 'Fire Nation', from: :nation

          click_button 'Search For Members'

          expect(current_path).to eq(search_path)
        end
      end
    end
  end
end
