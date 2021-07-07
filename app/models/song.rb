class Song < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: { scope: :release_year, message: "One per year"}
    validates_presence_of :release_year, :if => :released 


    validates :artist_name, presence: true

    validates :released, inclusion: [true, false]

    validate :test_future

    

    def test_future
        if self.release_year
            if self.release_year > Time.now.year
                errors.add(:release_year, "that release date is in the future")
            end
        end 
    end
end
