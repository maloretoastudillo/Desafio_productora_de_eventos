class Band < ApplicationRecord
    has_many :concerts, dependent: :destroy
    has_many :crews, dependent: :destroy 
    
    accepts_nested_attributes_for :crews

    enum band_type: %i[band girl_band boy_band]

    def number_of
        self.concerts.count
    end

    def total
        self.concerts.map{|concert| concert.assistants}.sum
    end

    def this_month
        self.concerts.where(date: (Date.today.beginning_of_month)..(Date.today)).count
    end

    def last_concert
        self.concerts.map{|concert| concert.date}.max    
    end

    def max_assistants
        self.concerts.map{|concert| concert.assistants}.max
    end

    def longest
        self.concerts.map{|concert| concert.duration}.max
    end

end
