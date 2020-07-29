require File.expand_path('../config/application', __FILE__)

namespace :db do
  desc "Migrate the db"
  task :migrate do
    # connection_details = YAML::load(ERB.new(File.read('config/database.yml')).result)
    # ActiveRecord::Base.establish_connection(connection_details[ENV["RACK_ENV"]])
    ActiveRecord::MigrationContext.new("db/migrate").migrate
  end


  desc 'Make seed data'
  task :seed do
    10.times do
      customer = Customer.create(first_name: Faker::Name.first_name, last_name: Faker::Name.first_name, email: Faker::Internet.email)
      puts "Created customer #{customer.id} (#{customer.first_name} #{customer.last_name}"
    end

    100.times do
      item = Item.create(name: Faker::Commerce.product_name, price: Faker::Commerce.price, sku: Faker::Code.ean)
      puts "Created item #{item.id} (#{item.sku})"
    end

    customer_count = Customer.count
    item_count = Item.count

    500.times do
      customer = Customer.offset(rand(customer_count)).first

      order = customer.orders.create

      rand(100).times do
        order.items << Item.offset(rand(item_count)).first
      end
    end
  end
end
