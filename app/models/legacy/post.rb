module Legacy
    class Post < ActiveRecord::Base
        # establish_connection 'wordpress_database'
        self.table_name = 'wp_posts'
        self.primary_key = 'ID'
    end
end