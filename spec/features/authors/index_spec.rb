require 'rails_helper'

RSpec.describe 'Author Index Page' do
    it "displays name of each author" do
        author_1 = Author.create!(name: 'Antonio', age: 1, alive: false)
        author_2 = Author.create!(name: 'Larry', age: 2, alive: true)
        author_3 = Author.create!(name: 'Cassandra', age: 3, alive: true)
        
        visit '/authors'
        within "#author-Antonio" do
            expect(page).to have_content('Antonio')
        end
        within "#author-Larry" do
            expect(page).to have_content('Larry')
        end
        within "#author-Cassandra" do
            expect(page).to have_content('Cassandra')
        end
    end

    it "has author name as a link to show page" do
        author_1 = Author.create!(name: 'Antonio', age: 1, alive: false)
        
        visit '/authors'
        click_link 'Visit Antonio Show Page'
        expect(current_path).to eq("/authors/#{author_1.id}")
        
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
    
    it "contains a link to update parent show page" do
        author_1 = Author.create!(name: 'Antonio', age: 1, alive: false)
        author_2 = Author.create!(name: 'Larry', age: 2, alive: true)
        author_3 = Author.create!(name: 'Cassandra', age: 3, alive: true)
        
        visit '/authors'
        within "#author-Antonio" do
            expect(page).to have_content("Update Antonio")
        end
        within "#author-Larry" do
            expect(page).to have_content("Update Larry")
        end
        within "#author-Cassandra" do
            expect(page).to have_content("Update Cassandra")
        end
        click_link "Update Antonio"
        expect(current_path).to eq("/authors/#{author_1.id}/edit")
        fill_in :name, with: 'Goo goo'
        fill_in :age, with: 2
        check :alive
        click_button 'Submit'
        expect(current_path).to eq("/authors/#{author_1.id}")
        expect(page).to have_content("Goo goo")
        expect(page).to have_content("2")
    end

     it "contains a link to delete parent" do
        author_1 = Author.create!(name: 'Antonio', age: 1, alive: false)
        author_2 = Author.create!(name: 'Larry', age: 2, alive: true)
        author_3 = Author.create!(name: 'Cassandra', age: 3, alive: true)
        
        visit '/authors'
        within "#author-Antonio" do
            expect(page).to have_content("Delete Antonio")
        end
        within "#author-Larry" do
            expect(page).to have_content("Delete Larry")
            expect(page).to_not have_content("Delete Antonio")

        end
        within "#author-Cassandra" do
            expect(page).to have_content("Delete Cassandra")
            expect(page).to_not have_content("Delete Antonio")
        end
        click_link "Delete Antonio"
        expect(current_path).to eq("/authors")
        expect(page).to_not have_content("Antonio")
        expect(page).to have_content("Larry")
        expect(page).to have_content("Cassandra")
        click_link "Delete Cassandra"
        expect(current_path).to eq("/authors")
        expect(page).to have_content("Larry")
        expect(page).to_not have_content("Cassandra")
    end

    it "has a link that sorts authors by number of books highest to lowest" do
        author_3 = Author.create!(name: "Cat", age: 5, alive: false)
        author_2 = Author.create!(name: "Boots", age: 5, alive: false)
        author_1 = Author.create!(name: "Apu", age: 5, alive: false)
        book_1 = author_1.books.create!(title: 'Lala Land', page_count: 100, fiction: true)
        book_2 = author_2.books.create!(title: 'Volcano Island', page_count: 200, fiction: false)
        book_3 = author_2.books.create!(title: 'Cool Island', page_count: 300, fiction: false)
        book_4 = author_3.books.create!(title: 'Lala Land 2', page_count: 100, fiction: true)
        book_5 = author_3.books.create!(title: 'Volcano Island 2', page_count: 200, fiction: false)
        book_6 = author_3.books.create!(title: 'Cool Island 2', page_count: 300, fiction: false)
        visit "/authors"
        expect('Apu').to appear_before('Boots')
        expect('Boo').to appear_before('Cat')
        click_link "Order Authors By Book Count"
        expect(current_path).to eq("/authors")
        expect('Cat').to appear_before('Boots')
        expect('Boots').to appear_before('Apu')
        within "#author-Apu" do
            expect(page).to have_content("Book Count: 1") 
        end
        within "#author-Boots" do
            expect(page).to have_content("Book Count: 2") 
        end
        within "#author-Cat" do
            expect(page).to have_content("Book Count: 3") 
        end
    end
    
    
end