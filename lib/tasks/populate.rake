namespace :db do
  desc "Erase and fill db"
  task :populate => :environment do
    require 'faker'
    
    [Post, Person].each(&:delete_all)
    
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
    
    Person.populate 50 do |person|
      @full_name = Faker::Name.name_with_middle.split
      
      person.first_name = @full_name[0]
      person.middle_name = @full_name[1]
      person.last_name = @full_name[2]
      
      person.updated_at = Faker::Time.between(2.days.ago, Date.today, :afternoon)
      person.created_at = Faker::Time.between(30.days.ago, Date.today, :evening)
    end
    
  end
end