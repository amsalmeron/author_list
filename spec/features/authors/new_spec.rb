require 'rails_helper'

RSpec.describe "Create a new Author link and form" do
    it "has a link to create new author on index page" do
        visit '/authors'
        expect(page).to have_link("New Author")
        click_link 'New Author'
        expect(current_path).to eq('/authors/new')
    end

    it "has a form on author new page" do
        visit '/authors/new'
        expect(find('form')).to have_content('Name')
        expect(find('form')).to have_content('Age')
        expect(find('form')).to have_content('Alive')
    end

    it "uses form to create a new author and has it displayed on index" do
        visit '/authors/new'
        fill_in :name, with: "Jerry"
        fill_in :age, with: 55
        check :alive
        click_button 'Submit'
        expect(current_path).to  eq('/authors')
        expect(page).to  have_content("Jerry")
    end
end