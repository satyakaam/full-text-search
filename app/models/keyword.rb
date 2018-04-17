class Keyword < ApplicationRecord
  belongs_to :document, polymorphic: true
end
