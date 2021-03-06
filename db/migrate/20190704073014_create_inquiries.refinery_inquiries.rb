# This migration comes from refinery_inquiries (originally 20101208082840)
class CreateInquiries < ActiveRecord::Migration[4.2]
  def up
    unless ::Refinery::Inquiries::Inquiry.table_exists?
      create_table :refinery_inquiries_inquiries, :force => true do |t|
        t.string   :name
        t.string   :email
        t.string   :phone
        t.text     :message
        t.boolean  :spam,     :default => false
        t.timestamps
      end

      add_index :refinery_inquiries_inquiries, :id
    end
  end

  def down
     drop_table ::Refinery::Inquiries::Inquiry.table_name

     if defined?(::Refinery::Page)
       ::Refinery::Page.delete_all(:link_url => Refinery::Inquiries.page_path_new)
       ::Refinery::Page.delete_all(:link_url => Refinery::Inquiries.page_path_thank_you)
     end
  end
end
