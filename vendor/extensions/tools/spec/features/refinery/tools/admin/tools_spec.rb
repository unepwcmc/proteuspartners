# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Tools" do
    describe "Admin" do
      describe "tools" do
        refinery_login_with :refinery_user

        describe "tools list" do
          before do
            FactoryGirl.create(:tool, :title => "UniqueTitleOne")
            FactoryGirl.create(:tool, :title => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.tools_admin_tools_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.tools_admin_tools_path

            click_link "Add New Tool"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Title", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Tools::Tool.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Title can't be blank")
              Refinery::Tools::Tool.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:tool, :title => "UniqueTitle") }

            it "should fail" do
              visit refinery.tools_admin_tools_path

              click_link "Add New Tool"

              fill_in "Title", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Tools::Tool.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:tool, :title => "A title") }

          it "should succeed" do
            visit refinery.tools_admin_tools_path

            within ".actions" do
              click_link "Edit this tool"
            end

            fill_in "Title", :with => "A different title"
            click_button "Save"

            page.should have_content("'A different title' was successfully updated.")
            page.should have_no_content("A title")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:tool, :title => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.tools_admin_tools_path

            click_link "Remove this tool forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Tools::Tool.count.should == 0
          end
        end

      end
    end
  end
end
