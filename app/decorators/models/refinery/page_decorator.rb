Refinery::Page.class_eval do

  has_and_belongs_to_many :banners, :class_name => '::Refinery::Banners::Banner', :join_table => 'refinery_banners_pages'
  has_and_belongs_to_many :pods, :class_name => '::Refinery::Pods::Pod', :join_table => 'refinery_pages_pods'

end