# require 'webrick' 

# # BindAddress:  "127.0.0.1",
# op = {  Port: 3000, DocumentRoot: "." }

# s = WEBrick::HTTPServer.new(op)

# s = WEBrick::HTTPServer.new(op)
# s.config[:MimeTypes]["erb"] = "text/html"
# trap(:INT){
#     s.shutdown
# }
# s.start
# # s.start

#! ruby -Ku
# -*- coding: utf-8 -*-
require "erb"
require "/Users/takeuchikazuto/project/ruby_mysql/app/controllers/users_controller.rb"
require "/Users/takeuchikazuto/project/ruby_mysql/app/controllers/articles_controller.rb"
require "webrick"


config = {
    :Port => 8099,
    :DocumentRoot => '.'
}

WEBrick::HTTPServlet::FileHandler.add_handler("erb", WEBrick::HTTPServlet::ERBHandler)
s = WEBrick::HTTPServer.new(config)
s.config[:MimeTypes]["erb"] = "text/html"

trap(:INT){
    s.shutdown
}


s.mount_proc '/users' do |req, res|
  res.body = UsersController.index()
end

s.mount_proc '/articles' do |req, res|
  res.body = ArticlesController.index()
end



s.start
