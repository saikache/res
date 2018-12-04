class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def created_on
    created_at.strftime("%D %I:%M %p")
  end
end
