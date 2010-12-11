namespace :users do
  desc "Create admin"
  task(:create_admin => :environment) do
    user = User.new(:role => 'admin', :name =>ENV['name'], :email => ENV['email'], :password => ENV['password'])
    if user.save
      puts "User created successfully."
    else
      puts "#{user.errors.count} errors prohibited this admin from being saved:"
      user.errors.full_messages.each do |msg|
        puts "- #{msg}"
      end
    end
  end
end