# As a visitor
# When I visit a parent show page
# Then I see a link to update the parent "Update Parent"
# When I click the link "Update Parent"
# Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/parents/:id',
# the parent's info is updated,
# and I am redirected to the Parent's Show page where I see the parent's updated info

require 'rails_helper'

RSpec.describe 'Update authors attributes' do
    it 'has a link on show that leads to a form to edit author' do
        author = Author.create!(name: "Jerry", age: 20, alive: true)
        visit "/authors/#{author.id}"
        expect(page).to have_content("Jerry")
        expect(page).to have_content("20")
        expect(page).to have_content("Alive: true")

        click_link 'Update Author'
        expect(current_path).to eq("/authors/#{author.id}/edit")
        expect(find('form')).to have_content('Name')
        expect(find('form')).to have_content('Age')
        expect(find('form')).to have_content('Alive')
    end

    it "updates author based on input form edit form" do
        author = Author.create!(name: "Jerry", age: 20, alive: true)
        visit "/authors/#{author.id}/edit"
        fill_in :name, with: "Thomas W."
        fill_in :age, with: 30
        click_button "submit"
        expect(current_path).to eq("/authors/#{author.id}")
        expect(page).to have_content("Thomas W.") 
    end
    
end