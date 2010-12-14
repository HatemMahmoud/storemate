namespace :storemate do
  desc "Setup"
  task(:setup => :environment) do
    if Company.count == 0
      puts "Creating first company..."
      company = Company.new(:name => 'StoreMate')
      company.save!
    end
    if Store.count == 0
      puts "Creating first store..."
      store = Company.first.stores.new(:name => 'Headquarter')
      store.save!
    end
    if User.where(:role => 'admin').count == 0
      puts "Creating first admin user..."
      user = Store.first.users.new(:role => 'admin', :name => ENV['name'], :email => ENV['email'], :password => ENV['password'])
      user.save!
      puts "System setup successfully."
    else
      puts "System already setup!"
    end
  end
end