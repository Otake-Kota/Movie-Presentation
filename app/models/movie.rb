class Movie < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many   :movie_comments, dependent: :destroy

  default_scope -> { order(created_at: :desc) }
  validates :name,        presence: true
  validates :user_id,     presence: true
  validates :category_id, presence: true
  validates :content,     presence: true
  validates :spoiler,    inclusion: { in: [true, false]}
  validates :movie_maxim, presence: true

  def feed
    MovieComment.where("movie_id = ?", id)
  end
end
