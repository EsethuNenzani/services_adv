module Refinery
  module Pods
    class Pod < Refinery::Core::BaseModel
      self.table_name = 'refinery_pods'

      POD_TYPES = %w(content banner gallery video inquiry)

      validates_presence_of :name

      belongs_to :image, :class_name => '::Refinery::Image', optional: true

      has_and_belongs_to_many :pages, :class_name => '::Refinery::Page', :join_table => 'refinery_pages_pods'

      def system_name
        pod_type
      end

    end
  end
end
