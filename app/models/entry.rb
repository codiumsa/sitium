class Entry < ApplicationRecord
  belongs_to :user
  has_attached_file :image,
    path: ':rails_root/public/system/entries/:id/:style/:filename',
    url: '/images/entries/:id/:style/:filename',
    styles: {
      fb_large: "1200x630#"
    },
    defautl_url: 'missing/entries/style.jpg',
    convert_options: {
      fb_large: "-quality 75 -strip"
    }

  validates :title, :slug, presence: true
  validates :status, inclusion: { in: %w(draft published hidden deleted) }
  validates :entry_type, inclusion: { in: %w(article page) }
  validates_attachment :image, content_type: { content_type: ["image/jpeg", "image/jpg", "image/png"] }, size: { in: 0..10.megabytes }

  scope :articles, -> { where(entry_type: 'article') }
  scope :pages, -> { where(entry_type: 'page') }

  scope :draft, -> { where(status: 'draft') }
  scope :published, -> { where(status: 'published') }
  scope :hidden, -> { where(status: 'hidden') }
  scope :deleted, -> { where(status: 'deleted') }

  scope :default_sort, -> { order("published_at DESC, updated_at DESC") }

  before_save :add_published_date

  def entry_type_route
    self.entry_type.pluralize
  end
  
  private
  def add_published_date
    self.published_at = DateTime.now if (self.published_at.blank? && self.status == 'published')
  end
end
