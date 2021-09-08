namespace :flatout do
  desc "Enriching a given user with Clearbit (sync)"
  task :check, [:user_id] => :environment do |t, args|
    user = User.find(args[:user_id])
    puts "Enriching #{user.email}..."
    FlaterJob.perform_now(user.id)
    # rake task will return when job is _done_
  end
end
