module Refinery
  module Galleries
    class Item < Refinery::Core::BaseModel
      self.table_name = 'refinery_items'

      belongs_to :image, :class_name => '::Refinery::Image'
      belongs_to :gallery, :class_name => '::Refinery::Galleries::Gallery'

    end
  end
end
