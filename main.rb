require 'mongoid'

ENV['enviroment'] = ENV['e'] || 'development'

puts ENV['enviroment']

Mongoid.load!(File.dirname(__FILE__) + '/config/mongoid.yml' , :development)
Dir[File.dirname(__FILE__) + '/lib/models/*.rb'].each {|file| require file }
