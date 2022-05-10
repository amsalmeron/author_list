require 'rails_helper'

RSpec.describe 'Author Show Page' do
    describe 'Show page' do
        it 'displays attributes for author on author show page' do 
            author = Author.create!(name: "Boo", age: 5, alive: false)

            visit "/authors/#{author.id}"

            expect(page).to have_content("Boo")
            expect(page).to have_content("Age: 5")
            expect(page).to have_content("Alive: false")
        end
    end
end