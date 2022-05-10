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
    
    
end
