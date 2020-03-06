Refinery::Blog::Post.class_eval do

  belongs_to :image, class_name: '::Refinery::Image', optional:true

end