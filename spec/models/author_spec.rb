require 'rails_helper'

RSpec.describe Author, type: :model do

    describe 'relationships' do
        it { should have_many(:books) }
    end

    describe 'validations' do
        it { should validate_presence_of(:name) }
        it { should validate_presence_of(:age) }
        it { should validate_numericality_of(:age) }
    end

    describe "class methods" do
        describe ".order_created" do
            it "orders authors by most recently created first" do
                author_1 = Author.create!(name: 'Antonio', age: 1, alive: false)
                author_2 = Author.create!(name: 'Larry', age: 2, alive: true)
                author_3 = Author.create!(name: 'Cassandra', age: 3, alive: true)

                authors = Author.all
                expect(authors.order_created).to eq([author_3,author_2,author_1])
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
    end
    
    
end
