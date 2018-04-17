class Document < ApplicationRecord
  include Searchable
  validates :description, presence: true
  # after_save :update_keywords

  is_searchable :description
end
