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
    
    
end
