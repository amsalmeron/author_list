require 'rails_helper'

RSpec.describe Author, type: :model do

    describe 'relationships' do
        it { should have_many(:books) }
    end

    describe 'validations' do
        it { should validate_presence_of(:name) }
        it { should validate_presence_of(:age) }
        it { should validate_numericality_of(:age) }
        it { should allow_value(true).for(:alive) }
        it { should allow_value(false).for(:alive) }
    end

    describe "class methods" do
        describe ".order_created" do
            it "orders authors by most recently created first" do
                author_1 = Author.create!(name: 'Antonio', age: 1, alive: false)
                author_2 = Author.create!(name: 'Larry', age: 2, alive: true)
                author_3 = Author.create!(name: 'Cassandra', age: 3, alive: true)

                expect(Author.order_created).to eq([author_3,author_2,author_1])
            end
        end        
    end

    describe "instance methods" do
        describe "#book_count" do
            it "counts total number of books per author" do
                author_1 = Author.create!(name: 'Antonio', age: 1, alive: false)
                book_1 = author_1.books.create!(title: 'Lala Land', page_count: 100, fiction: true)
                book_2 = author_1.books.create!(title: 'Volcano Island', page_count: 200, fiction: false)

                expect(author_1.book_count).to eq(2)
            end
        end
        
        describe "#alphabetize" do
            it "alphabetizes authors books" do
                author_1 = Author.create!(name: 'Antonio', age: 1, alive: false)
                book_1 = author_1.books.create!(title: 'Lala Land', page_count: 100, fiction: true)
                book_2 = author_1.books.create!(title: 'Volcano Island', page_count: 200, fiction: false)
                book_3 = author_1.books.create!(title: 'Bitcoin Standard', page_count: 200, fiction: false)
                book_4 = author_1.books.create!(title: 'Alcatraz', page_count: 200, fiction: false)
                expect(author_1.books).to eq([book_1, book_2, book_3, book_4])
                expect(author_1.alphabetize('true')).to eq([book_4, book_3, book_1, book_2])
            end
        end
    end
end
