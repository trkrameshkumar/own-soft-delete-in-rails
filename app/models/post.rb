class Post < ApplicationRecord
  include SoftDelete

  validates :name, :text, :user, presence: true
  belongs_to :user,	dependent: :destroy
end
