namespace :flatout do
  desc "Starting Flater Job"
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
