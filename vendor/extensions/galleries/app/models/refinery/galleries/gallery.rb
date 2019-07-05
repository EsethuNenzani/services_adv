module Refinery
  module Galleries
    class Gallery < Refinery::Core::BaseModel
      self.table_name = 'refinery_galleries'

      extend FriendlyId
      friendly_id :name, use: [:slugged]

      validates :name, :presence => true

      has_many :items, :class_name => "::Refinery::Galleries::Item", :dependent => :destroy
      accepts_nested_attributes_for :items, :reject_if => lambda { |item| item['image_id'].blank?}, :allow_destroy => true

      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      #   acts_as_indexed :fields => [:title]

      scope :active, -> {where(:is_active => true)}

    end
  end
end
