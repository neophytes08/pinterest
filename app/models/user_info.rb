class UserInfo < ActiveRecord::Base
 
  belongs_to :user
  has_many :pins

  has_attached_file :picture, styles: { medium: "300x300>" }
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/
  validates :fname, presence: true
  validates :lname, presence: true
  validates :bday, presence: true
  validates :picture, presence: true

end
