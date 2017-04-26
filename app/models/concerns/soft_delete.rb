module SoftDelete
  extend ActiveSupport::Concern

  included do
    
    scope :soft_deleted, -> { unscope(where: :deleted_at).where.not(deleted_at: nil) }
  	default_scope -> { where(deleted_at: nil) }

  	def soft_delete
	   update(deleted_at: Time.current)
	   User.reflect_on_all_associations(:has_many).each do |child|
	   	self.send(child.name).update(deleted_at: Time.current)
	   end
	end

  end
end