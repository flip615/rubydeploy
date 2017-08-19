class User < ActiveRecord::Base
  has_secure_password
  before_save :downcase_fields

  has_many :bright_ideas, dependent: :destroy, source: :bright_idea
  has_many :likes
  has_many :ideas_liked, through: :likes, source: :bright_idea

  validates :name, :alias, presence: true, length: 2..30
  validates :alias, uniqueness: true 
  validates_format_of :name, :alias, with: /\A[-a-z]+\Z/i
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

  	def downcase_fields
		self.name.downcase!
		self.alias.downcase!
		self.email.downcase!
	end
end
