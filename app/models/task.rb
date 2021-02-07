class Task < ApplicationRecord
    has_many :chores 
    has_many :children, through: :chores

    scope :alphabetical, -> { order('name') }
    scope :active,       -> { where(active: true) }

    validates_presence_of :name
    validates :points, numericality: { only_integer: true, :greater_than_or_equal_to => 0 }

end
