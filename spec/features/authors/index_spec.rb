require 'rails_helper'

RSpec.describe 'Author Index Page' do
    it "displays name of each author" do
        author_1 = Author.create!(name: 'Antonio', age: 1, alive: false)
        author_2 = Author.create!(name: 'Larry', age: 2, alive: true)
        author_3 = Author.create!(name: 'Cassandra', age: 3, alive: true)
        
        visit '/authors'

        expect(page).to have_content('Antonio')
        expect(page).to have_content('Larry')
        expect(page).to have_content('Cassandra')
    end

    it "displays created at attribute and lists authors in desc order created (most recent first)" do
        author_1 = Author.create!(name: 'Antonio', age: 1, alive: false)
        author_2 = Author.create!(name: 'Larry', age: 2, alive: true)
        author_3 = Author.create!(name: 'Cassandra', age: 3, alive: true)
        
        visit '/authors'

        expect(page).to have_content(author_1.created_at)
        expect(page).to have_content(author_3.created_at)
        expect(page).to have_content(author_2.created_at)

        expect('Cassandra').to appear_before('Larry')
        expect('Larry').to appear_before('Antonio')
    end
    

    it "displays link to books index page" do
        author = Author.create!(name: "Boo", age: 5, alive: false)
        book_1 = author.books.create!(title: 'Lala Land', page_count: 100, fiction: true)
        book_2 = author.books.create!(title: 'Volcano Island', page_count: 200, fiction: false)
        book_3 = author.books.create!(title: 'Cool Island', page_count: 300, fiction: false)

        visit "/authors"
        click_link "All Books"
        expect(current_path).to eq("/books")
    end
    
end