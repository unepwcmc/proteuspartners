module Refinery
  module Tools
    module Admin
      class ToolsController < ::Refinery::AdminController

        crudify :'refinery/tools/tool',
                :xhr_paging => true

        def self.searchable?
          false
        end

      end
    end
  end
end
