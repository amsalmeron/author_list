require 'rails_helper'

RSpec.describe 'Book Index Page' do
    it "displays attributes of all books" do
        author_1 = Author.create!(name: 'Antonio', age: 1, alive: false)
        author_2 = Author.create!(name: 'Larry', age: 2, alive: true)
        author_3 = Author.create!(name: 'Cassandra', age: 3, alive: true)

        book_1 = author_1.books.create!(title: 'Lala Land', page_count: 100, fiction: true)
        book_2 = author_1.books.create!(title: 'Volcano Island', page_count: 200, fiction: false)

        book_3 = author_2.books.create!(title: 'Voyager', page_count: 300, fiction: false)
        book_4 = author_2.books.create!(title: 'Miss Patty', page_count: 400, fiction: true)
        
        visit '/books'
        #book titles
        expect(page).to have_content('Lala Land')
        expect(page).to have_content('Volcano Island')
        expect(page).to have_content('Voyager')
        expect(page).to have_content('Miss Patty')
        #book page counts
        expect(page).to have_content('Page Count: 100')
        expect(page).to have_content('Page Count: 200')
        expect(page).to have_content('Page Count: 300')
        expect(page).to have_content('Page Count: 400')
        #book fiction vs non-ficiton
        expect(page).to have_content('Fiction: false', count: 2)
        expect(page).to have_content('Fiction: true', count: 2)
    end

    it "displays link to authors index page" do
        visit "/books"
        click_link "All Authors"
        expect(current_path).to eq("/authors")
    end

    it "has link to edit book attributes" do
        author_1 = Author.create!(name: 'Antonio', age: 1, alive: false)
        author_2 = Author.create!(name: 'Larry', age: 2, alive: true)

        book_1 = author_1.books.create!(title: 'Lala Land', page_count: 100, fiction: true)
        book_2 = author_1.books.create!(title: 'Volcano Island', page_count: 200, fiction: false)

        book_3 = author_2.books.create!(title: 'Voyager', page_count: 300, fiction: false)
        book_4 = author_2.books.create!(title: 'Miss Patty', page_count: 400, fiction: true)
        
        visit '/books'

        click_link "Update #{book_1.title}"
        expect(current_path).to eq("/books/#{book_1.id}/edit")
        fill_in "Title",	with: "Jungle Book"
        fill_in "Page count",	with: "400"
        click_button "Submit"
        expect(current_path).to eq("/books/#{book_1.id}")
        expect(page).to have_content("Jungle Book") 
        expect(page).to have_content("400") 
    end
    
end