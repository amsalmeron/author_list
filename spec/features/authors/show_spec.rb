require 'rails_helper'

RSpec.describe 'Author Show Page' do
    describe 'Show page' do
        it 'displays attributes for author on author show page' do 
            author = Author.create!(name: "Boo", age: 5, alive: false)

            visit "/authors/#{author.id}"

            expect(page).to have_content("Boo")
            expect(page).to have_content("Age: 5")
            expect(page).to have_content("Alive: false")
        end

        it 'displays author book count on author show page' do 
            author = Author.create!(name: "Boo", age: 5, alive: false)
            book_1 = author.books.create!(title: 'Lala Land', page_count: 100, fiction: true)
            book_2 = author.books.create!(title: 'Volcano Island', page_count: 200, fiction: false)
            book_3 = author.books.create!(title: 'Cool Island', page_count: 300, fiction: false)

            visit "/authors/#{author.id}"
            expect(page).to have_content("Book Count: 3")
        end

        it "displays link to books index page" do
            author = Author.create!(name: "Boo", age: 5, alive: false)
            book_1 = author.books.create!(title: 'Lala Land', page_count: 100, fiction: true)
            book_2 = author.books.create!(title: 'Volcano Island', page_count: 200, fiction: false)
            book_3 = author.books.create!(title: 'Cool Island', page_count: 300, fiction: false)

            visit "/authors/#{author.id}"
            click_link "All Books"
            expect(current_path).to eq("/books")
        end

        it "displays link to authors books index page" do
            author = Author.create!(name: "Boo", age: 5, alive: false)
            book_1 = author.books.create!(title: 'Lala Land', page_count: 100, fiction: true)
            book_2 = author.books.create!(title: 'Volcano Island', page_count: 200, fiction: false)
            book_3 = author.books.create!(title: 'Cool Island', page_count: 300, fiction: false)

            visit "/authors/#{author.id}"
            click_link "View Authors Books"
            expect(current_path).to eq("/authors/#{author.id}/books")
        end
        
    end
end