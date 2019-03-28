class CookBook < ApplicationRecord
    has_and_belongs_to_many :recipes
    belongs_to :user
    #validates :name, presence: true

end
