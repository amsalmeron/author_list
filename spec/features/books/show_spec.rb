require 'rails_helper'

RSpec.describe 'Book Show Page' do
    it "displays attributes specific book" do
        author_1 = Author.create!(name: 'Antonio', age: 1, alive: false)

        book_1 = author_1.books.create!(title: 'Lala Land', page_count: 100, fiction: true)

        visit "/books/#{book_1.id}"
        #book titles
        expect(page).to have_content('Lala Land')
        #book page counts
        expect(page).to have_content('Page Count: 100')
        #book fiction vs non-ficiton
        expect(page).to have_content('Fiction: true', count: 1)
    end

    it "displays link to authors index page" do
        visit "/books"
        click_link "All Authors"
        expect(current_path).to eq("/authors")
    end

    it "displays link to delete book" do
        author_1 = Author.create!(name: 'Antonio', age: 1, alive: false)
        author_2 = Author.create!(name: 'Larry', age: 2, alive: true)
        book_1 = author_1.books.create!(title: 'Lala Land', page_count: 100, fiction: true)
        book_2 = author_1.books.create!(title: 'Volcano Island', page_count: 200, fiction: true)
        book_3 = author_2.books.create!(title: 'Voyager', page_count: 300, fiction: true)
        visit '/books'
        expect(page).to have_content("Lala Land")   
        expect(page).to have_content("Voyager")  
        expect(page).to have_content("Volcano Island")

        visit "/books/#{book_1.id}"
        click_button "Delete Book"
        expect(current_path).to eq("/books")
        expect(page).to_not have_content("Lala Land")   
        expect(page).to have_content("Voyager")   
        expect(page).to have_content("Volcano Island")   
    end
    
    
end