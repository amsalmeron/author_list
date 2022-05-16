require 'rails_helper'

RSpec.describe "Delete Author", type: :feature do
    describe "ability to delete an author from show page" do
        it "has a link to delete author" do
            author = Author.create!(name: "Bob", age: 5, alive: false)
            book_1 = author.books.create!(title: 'Lala Land', page_count: 100, fiction: true)
            book_2 = author.books.create!(title: 'Volcano Island', page_count: 200, fiction: false)
            visit "/authors"
            expect(page).to have_content("Bob")
            visit "/authors/#{author.id}"
            click_link "Delete Author"
            expect(current_path).to eq("/authors")
            expect(page).to_not have_content("Bob")
        end
    end
end