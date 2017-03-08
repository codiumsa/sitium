class EntryTranslation < ApplicationRecord
  belongs_to :entry

  validates :title, :slug, presence: true
end
