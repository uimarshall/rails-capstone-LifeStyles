class Article < ApplicationRecord
    belongs_to :category
    has_many :votes, class_name: "votes", foreign_key: "reference_id"
end
