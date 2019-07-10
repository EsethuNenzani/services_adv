Refinery::Image.class_eval do

  has_many :items, class_name: '::Refinery::Galleries::Item', foreign_key: 'image_id', dependent: :destroy
  has_many :galleries, through: :items, class_name: '::Refinery::Galleries::Gallery'

end