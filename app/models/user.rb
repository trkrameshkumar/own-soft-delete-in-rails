class User < ApplicationRecord
 include SoftDelete

	has_many :posts,	dependent: :destroy
	validates :name, presence: true
end
