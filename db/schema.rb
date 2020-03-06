# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20200306094312) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "refinery_authentication_devise_roles", id: :serial, force: :cascade do |t|
    t.string "title"
  end

  create_table "refinery_authentication_devise_roles_users", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["role_id", "user_id"], name: "refinery_roles_users_role_id_user_id"
    t.index ["user_id", "role_id"], name: "refinery_roles_users_user_id_role_id"
  end

  create_table "refinery_authentication_devise_user_plugins", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.integer "position"
    t.index ["name"], name: "index_refinery_authentication_devise_user_plugins_on_name"
    t.index ["user_id", "name"], name: "refinery_user_plugins_user_id_name", unique: true
  end

  create_table "refinery_authentication_devise_users", id: :serial, force: :cascade do |t|
    t.string "username", null: false
    t.string "email", null: false
    t.string "encrypted_password", null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.integer "sign_in_count"
    t.datetime "remember_created_at"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "slug"
    t.string "full_name"
    t.index ["id"], name: "index_refinery_authentication_devise_users_on_id"
    t.index ["slug"], name: "index_refinery_authentication_devise_users_on_slug"
  end

  create_table "refinery_banners", force: :cascade do |t|
    t.string "name"
    t.string "title"
    t.text "description"
    t.integer "image_id"
    t.string "url"
    t.boolean "is_active"
    t.date "start_date"
    t.date "expiry_date"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "refinery_banners_pages", id: false, force: :cascade do |t|
    t.integer "page_id"
    t.integer "banner_id"
    t.index ["banner_id"], name: "index_refinery_banners_pages_on_banner_id"
    t.index ["page_id"], name: "index_refinery_banners_pages_on_page_id"
  end

  create_table "refinery_blog_categories", id: :serial, force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "slug"
    t.index ["id"], name: "index_refinery_blog_categories_on_id"
    t.index ["slug"], name: "index_refinery_blog_categories_on_slug"
  end

  create_table "refinery_blog_categories_blog_posts", id: :serial, force: :cascade do |t|
    t.integer "blog_category_id"
    t.integer "blog_post_id"
    t.index ["blog_category_id", "blog_post_id"], name: "index_blog_categories_blog_posts_on_bc_and_bp"
  end

  create_table "refinery_blog_category_translations", force: :cascade do |t|
    t.integer "refinery_blog_category_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.string "slug"
    t.index ["locale"], name: "index_refinery_blog_category_translations_on_locale"
    t.index ["refinery_blog_category_id"], name: "index_a0315945e6213bbe0610724da0ee2de681b77c31"
  end

  create_table "refinery_blog_comments", id: :serial, force: :cascade do |t|
    t.integer "blog_post_id"
    t.boolean "spam"
    t.string "name"
    t.string "email"
    t.text "body"
    t.string "state"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["blog_post_id"], name: "index_refinery_blog_comments_on_blog_post_id"
    t.index ["id"], name: "index_refinery_blog_comments_on_id"
  end

  create_table "refinery_blog_post_translations", force: :cascade do |t|
    t.integer "refinery_blog_post_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "body"
    t.text "custom_teaser"
    t.string "custom_url"
    t.string "slug"
    t.string "title"
    t.index ["locale"], name: "index_refinery_blog_post_translations_on_locale"
    t.index ["refinery_blog_post_id"], name: "index_refinery_blog_post_translations_on_refinery_blog_post_id"
  end

  create_table "refinery_blog_posts", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.boolean "draft"
    t.datetime "published_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "user_id"
    t.string "custom_url"
    t.text "custom_teaser"
    t.string "source_url"
    t.string "source_url_title"
    t.integer "access_count", default: 0
    t.string "slug"
    t.string "username"
    t.integer "image_id"
    t.index ["access_count"], name: "index_refinery_blog_posts_on_access_count"
    t.index ["id"], name: "index_refinery_blog_posts_on_id"
    t.index ["slug"], name: "index_refinery_blog_posts_on_slug"
  end

  create_table "refinery_categories", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "refinery_categories_projects", id: false, force: :cascade do |t|
    t.integer "project_id"
    t.integer "category_id"
    t.index ["category_id"], name: "index_refinery_categories_projects_on_category_id"
    t.index ["project_id"], name: "index_refinery_categories_projects_on_project_id"
  end

  create_table "refinery_clients", force: :cascade do |t|
    t.string "name"
    t.integer "image_id"
    t.string "url"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "refinery_galleries", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.boolean "is_active"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_refinery_galleries_on_slug"
  end

  create_table "refinery_image_translations", force: :cascade do |t|
    t.integer "refinery_image_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_alt"
    t.string "image_title"
    t.index ["locale"], name: "index_refinery_image_translations_on_locale"
    t.index ["refinery_image_id"], name: "index_refinery_image_translations_on_refinery_image_id"
  end

  create_table "refinery_images", id: :serial, force: :cascade do |t|
    t.string "image_mime_type"
    t.string "image_name"
    t.integer "image_size"
    t.integer "image_width"
    t.integer "image_height"
    t.string "image_uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "refinery_inquiries_inquiries", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.text "message"
    t.boolean "spam", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["id"], name: "index_refinery_inquiries_inquiries_on_id"
  end

  create_table "refinery_items", force: :cascade do |t|
    t.integer "image_id"
    t.integer "gallery_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position"
    t.index ["gallery_id"], name: "index_refinery_items_on_gallery_id"
    t.index ["image_id"], name: "index_refinery_items_on_image_id"
  end

  create_table "refinery_page_part_translations", force: :cascade do |t|
    t.integer "refinery_page_part_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "body"
    t.index ["locale"], name: "index_refinery_page_part_translations_on_locale"
    t.index ["refinery_page_part_id"], name: "index_refinery_page_part_translations_on_refinery_page_part_id"
  end

  create_table "refinery_page_parts", id: :serial, force: :cascade do |t|
    t.integer "refinery_page_id"
    t.string "slug"
    t.integer "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "title"
    t.index ["id"], name: "index_refinery_page_parts_on_id"
    t.index ["refinery_page_id"], name: "index_refinery_page_parts_on_refinery_page_id"
  end

  create_table "refinery_page_translations", force: :cascade do |t|
    t.integer "refinery_page_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.string "custom_slug"
    t.string "menu_title"
    t.string "slug"
    t.index ["locale"], name: "index_refinery_page_translations_on_locale"
    t.index ["refinery_page_id"], name: "index_refinery_page_translations_on_refinery_page_id"
  end

  create_table "refinery_pages", id: :serial, force: :cascade do |t|
    t.integer "parent_id"
    t.string "path"
    t.boolean "show_in_menu", default: true
    t.string "link_url"
    t.string "menu_match"
    t.boolean "deletable", default: true
    t.boolean "draft", default: false
    t.boolean "skip_to_first_child", default: false
    t.integer "lft"
    t.integer "rgt"
    t.integer "depth"
    t.string "view_template"
    t.string "layout_template"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "children_count", default: 0, null: false
    t.index ["depth"], name: "index_refinery_pages_on_depth"
    t.index ["id"], name: "index_refinery_pages_on_id"
    t.index ["lft"], name: "index_refinery_pages_on_lft"
    t.index ["parent_id"], name: "index_refinery_pages_on_parent_id"
    t.index ["rgt"], name: "index_refinery_pages_on_rgt"
  end

  create_table "refinery_pages_pods", id: false, force: :cascade do |t|
    t.integer "page_id"
    t.integer "pod_id"
    t.index ["page_id"], name: "index_refinery_pages_pods_on_page_id"
    t.index ["pod_id"], name: "index_refinery_pages_pods_on_pod_id"
  end

  create_table "refinery_pods", force: :cascade do |t|
    t.string "name"
    t.text "body"
    t.string "url"
    t.integer "image_id"
    t.string "pod_type"
    t.integer "gallery_id"
    t.string "video_url"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "refinery_projects", force: :cascade do |t|
    t.string "title"
    t.string "client"
    t.string "year"
    t.text "description"
    t.integer "cover_image_id"
    t.integer "image1_id"
    t.integer "image2_id"
    t.integer "image3_id"
    t.integer "image4_id"
    t.integer "image5_id"
    t.integer "image6_id"
    t.integer "image7_id"
    t.integer "image8_id"
    t.integer "image9_id"
    t.integer "image10_id"
    t.integer "image11_id"
    t.integer "image12_id"
    t.string "image1_size"
    t.string "image2_size"
    t.string "image3_size"
    t.string "image4_size"
    t.string "image5_size"
    t.string "image6_size"
    t.string "image7_size"
    t.string "image8_size"
    t.string "image9_size"
    t.string "image10_size"
    t.string "image11_size"
    t.string "image12_size"
    t.integer "video_id"
    t.boolean "is_featured"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "refinery_resource_translations", force: :cascade do |t|
    t.integer "refinery_resource_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "resource_title"
    t.index ["locale"], name: "index_refinery_resource_translations_on_locale"
    t.index ["refinery_resource_id"], name: "index_refinery_resource_translations_on_refinery_resource_id"
  end

  create_table "refinery_resources", id: :serial, force: :cascade do |t|
    t.string "file_mime_type"
    t.string "file_name"
    t.integer "file_size"
    t.string "file_uid"
    t.string "file_ext"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "refinery_settings", id: :serial, force: :cascade do |t|
    t.string "name"
    t.text "value"
    t.boolean "destroyable", default: true
    t.string "scoping"
    t.boolean "restricted", default: false
    t.string "form_value_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "slug"
    t.string "title"
    t.index ["name"], name: "index_refinery_settings_on_name"
  end

  create_table "refinery_teams", force: :cascade do |t|
    t.string "name"
    t.string "title"
    t.integer "image_id"
    t.string "email_address"
    t.text "description"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "seo_meta", id: :serial, force: :cascade do |t|
    t.integer "seo_meta_id"
    t.string "seo_meta_type"
    t.string "browser_title"
    t.text "meta_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id"], name: "index_seo_meta_on_id"
    t.index ["seo_meta_id", "seo_meta_type"], name: "id_type_index_on_seo_meta"
  end

  create_table "taggings", id: :serial, force: :cascade do |t|
    t.integer "tag_id"
    t.string "taggable_type"
    t.integer "taggable_id"
    t.string "tagger_type"
    t.integer "tagger_id"
    t.string "context"
    t.datetime "created_at"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
  end

  create_table "tags", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

end
