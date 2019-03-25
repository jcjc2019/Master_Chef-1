class CookBook < ApplicationRecord
    belongs_to :user
    belongs_to :recipe

    validates :name, presence: true

end
