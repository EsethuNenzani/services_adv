module Refinery
  module Galleries
    class Item < Refinery::Core::BaseModel
      self.table_name = 'refinery_items'

      belongs_to :image, :class_name => '::Refinery::Image'
      belongs_to :gallery, :class_name => '::Refinery::Galleries::Gallery'

      default_scope ->{order(:position)}

      after_create :set_position

      def set_position
        self.update_column(:position,  self.id)
      end

    end
  end
end
