module Refinery
  module Galleries
    class Gallery < Refinery::Core::BaseModel
      self.table_name = 'refinery_galleries'

      extend FriendlyId
      friendly_id :name, use: [:slugged]

      validates :name, :presence => true

      has_many :items, class_name: '::Refinery::Galleries::Item', foreign_key: 'gallery_id', dependent: :destroy
      has_many :images, through: :items, class_name: '::Refinery::Image'
      
      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      #   acts_as_indexed :fields => [:title]

      scope :active, -> {where(:is_active => true)}

    end
  end
end
