namespace :scheduler do
  desc "This task is called by the Heroku scheduler add-on"
  task :check => :environment do
    users = User.all
    users.each do |user|
      if user.id != 1
        puts "Enriching #{user.email}..."
        FlaterJob.perform_later(user.id)
      end
    end
  end
end
