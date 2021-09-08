namespace :flatout do
  desc "Starting Flater Job"
  task :check, [:user_id] => :environment do |t, args|
    p args[:user_id]
    user = User.find(args[:user_id])
    puts "Enriching #{user.email}..."
    FlaterJob.set(wait: 10.second).perform_later(user.id)
    # rake task will return when job is _done_
  end
end
