class Pin < ActiveRecord::Base
  acts_as_votable
  belongs_to :user
  belongs_to :user_info

  has_attached_file :image, styles: { medium: "300x300>" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates :title, presence: true
  validates :description, presence: true
  validates :image, presence: true

  def avatar_url
    image.url(:medium)
  end
end
