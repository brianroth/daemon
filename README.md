# ActiveRecord & Sidekiq without Rails

A Ruby project that uses ActiveRecord and Sidekiq without all of Rails, all orchestrated using docker compose.

## Running the application

* Bring up the containers

$ docker-compose up --build

* Run database migrations

$ docker-compose exec app rake db:migrate

* Load seed data.  This isn't necessary, it is just for illustrative purposes.

$ docker compose exec app rake seed

* Run a console

$ docker-compose exec app irb
```
irb(main):001:0> require "./config/application.rb"
=> true
irb(main):002:0> Customer.create(first_name: 'Lemmy', last_name: 'Killmister')
=> #<Customer id: 1, first_name: "Lemmy", last_name: "Killmister", email: nil, created_at: "2020-07-29 01:41:59", updated_at: "2020-07-29 01:41:59">
irb(main):003:0> Customer.count
=> 1
irb(main):004:0> MyWorker.perform_async
=> "fd288a484c508147b3096a5f"
```

* View the Sidekiq admin console

Open http://localhost:3001/ in your browser


