class Movie < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many   :movie_comments, dependent: :destroy
  has_many   :likes, dependent: :destroy
  has_many   :iine_users, through: :likes, source: :user

  default_scope -> { order(created_at: :desc) }
  validates :name,        presence: true
  validates :user_id,     presence: true
  validates :category_id, presence: true
  validates :content,     presence: true
  validates :spoiler,    inclusion: { in: [true, false]}
  validates :movie_maxim, presence: true

  # いいねする
  def iine(user)
    likes.create(user_id: user.id)
  end

  # いいね解除
  def uniine(user)
    likes.find_by(user_id: user.id).destroy
  end

  def iine?(user)
    iine_users.include?(user)
  end

  def feed
    MovieComment.where("movie_id = ?", id)
  end
end
