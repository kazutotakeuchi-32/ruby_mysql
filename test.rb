require 'erb'
require '/Users/takeuchikazuto/project/ruby_mysql/app/model/user.rb'

erb = File.read('/Users/takeuchikazuto/project/ruby_mysql/app/views/users/index.html.erb')
@users = User.all().map{|r|r}
 
p @users
result = ERB.new(erb).result(binding)
puts result

