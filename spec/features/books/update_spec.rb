# As a visitor
# When I visit a Child Show page
# Then I see a link to update that Child "Update Child"
# When I click the link
# I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
# When I click the button to submit the form "Update Child"
# Then a `PATCH` request is sent to '/child_table_name/:id',
# the child's data is updated,
# and I am redirected to the Child Show page where I see the Child's updated information

require 'rails_helper'

RSpec.describe 'Update Books through Book Show Page' do
    it "has a link to form that updates book attributes" do
        author = Author.create!(name: 'Jerry', age: 50, alive: true)
        book = author.books.create!(title: 'Blues Clues', page_count: 100, fiction: true)

        visit "/books/#{book.id}"
        click_button "Update"

        expect(current_path).to eq("/books/#{book.id}/edit")
        fill_in :title, with: "The Great Gatsby"
        fill_in :page_count, with: 500
        check :fiction
        click_button 'Submit'
        expect(current_path).to eq("/books/#{book.id}")
        expect(page).to have_content("The Great Gatsby") 
        expect(page).to have_content("500") 
        expect(page).to have_content("Fiction: true") 
        expect(page).to_not have_content("Blues Clues") 
        expect(page).to_not have_content("100") 
    end
    
end