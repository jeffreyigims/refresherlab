class Child < ApplicationRecord
    has_many :chores 
    has_many :tasks, through: :chores
    
    scope :alphabetical, -> { order('last_name', 'first_name') }
    scope :active,       -> { where(active: true) }

    validates_presence_of :first_name, :last_name 

    def name 
        self.first_name + " " + self.last_name 
    end 

    def points_earned 
        self.chores.done.inject(0){|sum,chore| sum += chore.task.points}
    end 
    
end
