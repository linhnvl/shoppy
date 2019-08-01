class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  scope :order_desc, ->{order created_at: :desc}
end
