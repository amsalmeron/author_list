require 'rails_helper'

RSpec.describe 'Authors Books Index Page' do
    it "displays name of each author" do
        author_1 = Author.create!(name: 'Antonio', age: 1, alive: false)
        book_1 = author_1.books.create!(title: 'Lala Land', page_count: 100, fiction: true)
        book_2 = author_1.books.create!(title: 'Volcano Island', page_count: 200, fiction: false)
        
        visit "/authors/#{author_1.id}/books"
        expect(page).to have_content('Antonio')

        expect(page).to have_content('Title: Lala Land')
        expect(page).to have_content('Page Count: 100')
        expect(page).to have_content('Fiction: true')

        expect(page).to have_content('Title: Volcano Island')
        expect(page).to have_content('Page Count: 200')
        expect(page).to have_content('Fiction: false')        
    end

    it "displays link to sort books in alphabetical order" do
        author_1 = Author.create!(name: 'Antonio', age: 1, alive: false)
        book_1 = author_1.books.create!(title: 'Lala Land', page_count: 100, fiction: true)
        book_2 = author_1.books.create!(title: 'Volcano Island', page_count: 200, fiction: false)
        book_3 = author_1.books.create!(title: 'Bitcoin Standard', page_count: 200, fiction: false)
        book_4 = author_1.books.create!(title: 'Alcatraz', page_count: 200, fiction: false)
        
        visit "/authors/#{author_1.id}/books"
    
        expect("Lala Land").to appear_before('Bitcoin Standard') 
        expect("Lala Land").to appear_before('Alcatraz') 
        click_link "Alphabetize Books"
        expect("Alcatraz").to appear_before('Bitcoin Standard') 
        expect("Bitcoin Standard").to appear_before('Lala Land') 
        expect("Lala Land").to appear_before('Volcano Island') 
    end

    it "displays link to sort books in alphabetical order" do
        author_1 = Author.create!(name: 'Antonio', age: 1, alive: false)
        book_1 = author_1.books.create!(title: 'Lala Land', page_count: 100, fiction: true)
        book_2 = author_1.books.create!(title: 'Volcano Island', page_count: 300, fiction: false)
        book_3 = author_1.books.create!(title: 'Bitcoin Standard', page_count: 150, fiction: false)
        book_3 = author_1.books.create!(title: 'Fiat Standard', page_count: 200, fiction: false)
        book_4 = author_1.books.create!(title: 'Alcatraz', page_count: 201, fiction: false)
        
        visit "/authors/#{author_1.id}/books"
    
        fill_in :page_limit, with: 200
        click_button "Filter"
        expect(page).to have_content("Lala Land")  
        expect(page).to have_content("Bitcoin Standard")  
        expect(page).to have_content("Fiat Standard")  
        expect(page).to_not have_content("Alcatraz")  
        expect(page).to_not have_content("Volcano Island")  
    end
    
    
end