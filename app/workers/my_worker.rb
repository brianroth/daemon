require 'sidekiq'

class MyWorker
  include Sidekiq::Worker

  def perform
    (1..1000).each do |n|
      puts "Iteration #{n}"
      sleep 10
    end
  end
end