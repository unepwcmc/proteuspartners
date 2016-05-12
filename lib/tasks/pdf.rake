namespace :pdf do
  desc 'Imported legacy PDF content'
  task :import => :environment do
    Legacy::Post.where("post_type = 'attachment' AND post_mime_type = 'application/pdf'").find_each do |p|
    # Legacy::Post.where("post_type = 'attachment' AND post_mime_type = 'application/pdf'").limit(5).each do |p|

      resource = ::Refinery::Resource.new
      new_url = p.guid.gsub(/\Ahttp:\/\/www.proteuspartners.org\/wp-content/,'')
      resource.file = File.new("#{Rails.root}/public#{new_url}")
      resource.save!
      
      document = ::Refinery::Documents::Document.new
      document.title = p.post_name.titleize
      document.document_id = resource.id
      document.legacy_url = p.guid
      document.save!

    end
  end
end