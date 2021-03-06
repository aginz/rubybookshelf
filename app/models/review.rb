class Review < ActiveRecord::Base
  belongs_to :book
  belongs_to :reviewer, class_name: "User", foreign_key: :user_id

  validates :body, presence: true

  delegate :email, to: :reviewer, prefix: true

  def self.with_ratings
    where.not(rating: nil)
  end
end
