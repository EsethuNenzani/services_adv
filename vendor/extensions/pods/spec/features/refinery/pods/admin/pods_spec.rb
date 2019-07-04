# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Pods" do
    describe "Admin" do
      describe "pods", type: :feature do
        refinery_login

        describe "pods list" do
          before do
            FactoryBot.create(:pod, :name => "UniqueTitleOne")
            FactoryBot.create(:pod, :name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.pods_admin_pods_path
            expect(page).to have_content("UniqueTitleOne")
            expect(page).to have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.pods_admin_pods_path

            click_link "Add New Pod"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Name", :with => "This is a test of the first string field"
              expect { click_button "Save" }.to change(Refinery::Pods::Pod, :count).from(0).to(1)

              expect(page).to have_content("'This is a test of the first string field' was successfully added.")
            end
          end

          context "invalid data" do
            it "should fail" do
              expect { click_button "Save" }.not_to change(Refinery::Pods::Pod, :count)

              expect(page).to have_content("Name can't be blank")
            end
          end

          context "duplicate" do
            before { FactoryBot.create(:pod, :name => "UniqueTitle") }

            it "should fail" do
              visit refinery.pods_admin_pods_path

              click_link "Add New Pod"

              fill_in "Name", :with => "UniqueTitle"
              expect { click_button "Save" }.not_to change(Refinery::Pods::Pod, :count)

              expect(page).to have_content("There were problems")
            end
          end

        end

        describe "edit" do
          before { FactoryBot.create(:pod, :name => "A name") }

          it "should succeed" do
            visit refinery.pods_admin_pods_path

            within ".actions" do
              click_link "Edit this pod"
            end

            fill_in "Name", :with => "A different name"
            click_button "Save"

            expect(page).to have_content("'A different name' was successfully updated.")
            expect(page).not_to have_content("A name")
          end
        end

        describe "destroy" do
          before { FactoryBot.create(:pod, :name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.pods_admin_pods_path

            click_link "Remove this pod forever"

            expect(page).to have_content("'UniqueTitleOne' was successfully removed.")
            expect(Refinery::Pods::Pod.count).to eq(0)
          end
        end

      end
    end
  end
end
