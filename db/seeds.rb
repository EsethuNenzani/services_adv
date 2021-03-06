# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Added by Refinery CMS Pages extension
Refinery::Pages::Engine.load_seed

# Added by Refinery CMS Banners extension
Refinery::Banners::Engine.load_seed

# Added by Refinery CMS Inquiries engine
Refinery::Inquiries::Engine.load_seed

# Added by Refinery CMS Pods extension
Refinery::Pods::Engine.load_seed

# Added by Refinery CMS Galleries extension
Refinery::Galleries::Engine.load_seed

# Added by Refinery CMS Blog engine
Refinery::Blog::Engine.load_seed
