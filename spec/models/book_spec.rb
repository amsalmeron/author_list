require 'rails_helper'

RSpec.describe Book, type: :model do
    
    describe 'relationships' do
        it { should belong_to(:author) }
    end

    describe "validations" do
        it { should validate_presence_of(:title)}
        it { should validate_presence_of(:page_count)}
        it { should validate_numericality_of(:page_count)}
        it { should allow_value(true).for(:fiction) }
        it { should allow_value(false).for(:fiction) }
    end

    describe ".class_methods" do
        describe ".alphabetize_books" do
            it "it alphabetizes books by title" do
                author_1 = Author.create!(name: 'Antonio', age: 1, alive: false)
                author_2 = Author.create!(name: 'Larry', age: 2, alive: true)

                book_1 = author_1.books.create!(title: 'Lala Land', page_count: 100, fiction: true)
                book_2 = author_1.books.create!(title: 'Volcano Island', page_count: 200, fiction: false)
                book_3 = author_2.books.create!(title: 'Voyager', page_count: 300, fiction: false)
                book_4 = author_2.books.create!(title: 'Miss Patty', page_count: 400, fiction: true)

                expect(Book.all).to eq([book_1, book_2, book_3, book_4])
                expect(Book.alphabetize_books('true')).to eq([book_1, book_4, book_2, book_3])
            end
        end

        describe ".page_max" do
            it "only shows books under page count threshold" do
                author_1 = Author.create!(name: 'Antonio', age: 1, alive: false)
                author_2 = Author.create!(name: 'Larry', age: 2, alive: true)

                book_1 = author_1.books.create!(title: 'Lala Land', page_count: 100, fiction: true)
                book_2 = author_1.books.create!(title: 'Volcano Island', page_count: 300, fiction: false)
                book_3 = author_2.books.create!(title: 'Voyager', page_count: 200, fiction: false)
                book_4 = author_2.books.create!(title: 'Miss Patty', page_count: 400, fiction: true)

                expect(Book.page_max(200)).to eq([book_1, book_3])
            end
            
        end
        
    end
    
    
    
end
