require 'erb'
require "pry"
require "/app/model/user.rb"

# erb = File.read('/Users/takeuchikazuto/project/ruby_mysql/app/views/users/index.html.erb')

# def index
#   erb = File.read('app/views/users/index.html.erb')
#   @users = User.all().map{|r|r}
#   @users
#   result = ERB.new(erb).result(binding)
#   result
# end

# def show(params = nil)
# end
# begin
#   name 
# rescue => exception
#   p exception.backtrace
# else
#   puts "safety zone"
# end

require "#{__dir__ }/error/my_error.rb"

class N
  # extend ErrorListModule
  # N.test
  include ErrorListModule
  # N.new.test
end

# p N::MyError
# p N::SyntaxError
# p N::test
# p (N.new).MyErr

# begin
#   .
# #  raise N::SyntaxError.new("test")
# rescue  => e
#   p e
# # rescue N::MyError => e
# #   p e
# #   p e.class.superclass.superclass.superclass
# #   p e.backtrace
# #   p e.message
# # rescue N::SyntaxError => e
# #   p N::SyntaxError.new("syntax error") 
# end


begin
  name 
rescue => exception
  p exception.message
else
  # p "safe"
end
