module Refinery
  module Banners
    class Banner < Refinery::Core::BaseModel
      self.table_name = 'refinery_banners'


      validates_presence_of :name, :image

      belongs_to :image, :class_name => '::Refinery::Image'
      has_and_belongs_to_many :pages, :class_name => '::Refinery::Page', :join_table => 'refinery_banners_pages'

      scope :active, -> {where("is_active = ? AND start_date <= ? AND expiry_date >= ?", true, Date.today, Date.today)}

    end
  end
end
