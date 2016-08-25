namespace :db do
  desc "Erase and fill Posts"
  task :populate => :environment do
    require 'faker'
    
    [Post].each(&:delete_all)
    
    Post.populate 100 do |post|
      post.title = Faker::StarWars.quote
      post.content = Faker::Lorem.paragraphs(5).join("\n")
      post.updated_at = Faker::Time.between(2.days.ago, Date.today, :afternoon)
      post.created_at = Faker::Time.between(30.days.ago, Date.today, :evening)
    end
    
  end
end