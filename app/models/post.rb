class Post < ApplicationRecord
  belongs_to :user
  has_many :comments , dependent: :destroy
  has_many :reactions, dependent: :destroy

  kinds = %w[ like dislike]. freeze
end
