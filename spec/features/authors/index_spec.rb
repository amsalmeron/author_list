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
    
end