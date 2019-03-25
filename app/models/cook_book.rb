class CookBook < ApplicationRecord
    balongs_to :user
    balongs_to :recipe
end
