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
        click_button "Submit"
        expect(current_path).to eq("/authors/#{author.id}")
        expect(page).to have_content("Thomas W.") 
    end
    
end