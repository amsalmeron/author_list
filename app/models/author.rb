class Author < ApplicationRecord

    validates_presence_of :name
    validates :age, presence: true, numericality: true
    validates :alive, inclusion: { in: [true, false] }
    
    has_many :books

    def self.order_created
        order(created_at: :desc)
    end
    
end