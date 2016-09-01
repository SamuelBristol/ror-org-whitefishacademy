namespace :db do
  desc "Erase and fill db"
  task :populate => :environment do
    require 'faker'
    
    [Post].each(&:delete_all)
    
    Post.populate 100 do |post|
      post.title = Faker::StarWars.quote
      post.content = '#' + Faker::StarWars.quote + "\n" +
        "###" + Faker::Hipster.sentence + "\n\n" +
        Faker::Hipster.paragraphs(25).join(' ') + "\n\n" +
        "###" + Faker::Hipster.sentence + "\n\n" +
        Faker::Hipster.paragraphs(25).join(' ') + "\n\n" +
        "###" + Faker::Hipster.sentence + "\n\n" +
        Faker::Hipster.paragraphs(25).join(' ')
      post.updated_at = Faker::Time.between(2.days.ago, Date.today, :afternoon)
      post.created_at = Faker::Time.between(30.days.ago, Date.today, :evening)
    end
    
  end
end