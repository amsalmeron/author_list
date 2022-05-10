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
    
end