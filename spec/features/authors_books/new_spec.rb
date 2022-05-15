# As a visitor
# When I visit a Parent Childs Index page
# Then I see a link to add a new adoptable child for that parent "Create Child"
# When I click the link
# I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
# When I fill in the form with the child's attributes:
# And I click the button "Create Child"
# Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
# a new child object/row is created for that parent,
# and I am redirected to the Parent Childs Index page where I can see the new child listed
require 'rails_helper'

RSpec.describe 'creation of books belonging to author' do
    it 'has form to create a new book using link from author show page' do
        author = Author.create!(name: 'Jerry', age: 20, alive: true)
        visit "/authors/#{author.id}/books"
        click_link "Add New Book"
        expect(current_path).to eq("/authors/#{author.id}/books/new")
        expect(find('form')).to have_content('Title')
        expect(find('form')).to have_content('Page count')
        expect(find('form')).to have_content('Fiction')
    end

    it 'uses filled out form to add a new book assigned to author' do
        author = Author.create!(name: 'Jerry', age: 20, alive: true)
        visit "/authors/#{author.id}/books/new"
        fill_in "Title",	with: "Bobby Jane" 
        fill_in "Page count",	with: 600
        fill_in "Fiction",	with: true
        click_button 'Submit' 
        expect(current_path).to eq("/authors/#{author.id}/books")
        expect(page).to have_content("Bobby Jane")  
        expect(page).to have_content("Page Count: 600")  
        expect(page).to have_content("Fiction: true")  
    end
end