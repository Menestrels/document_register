class Document < ApplicationRecord
    belongs_to :user
    has_many_attached :files

    validates :name, presence: true
end
