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
require "/Users/takeuchikazuto/project/ruby_mysql/app/controllers/api/v1/users_controller.rb"
require "/Users/takeuchikazuto/project/ruby_mysql/app/controllers/api/v1/articles_controller.rb"
require "/Users/takeuchikazuto/project/ruby_mysql/app/controllers/users_controller.rb"
require "/Users/takeuchikazuto/project/ruby_mysql/app/controllers/articles_controller.rb"
require "webrick"
include Api::V1 


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

s.mount_proc '/api/v1/users' do |req,res|
  begin
    path = req.path
    query = req.query
    p query['users']
    params = { id: path.split("/")[-1] }.merge(query)

    case req.request_method
      when "GET"
        if path.match(/api\v1\/users\/[0-9]\/is_logined/)
          return nil
        end
        if path.match(/api\/v1\/users\/[0-9]/)
          res.body = Api::V1::UsersController.show(params)
        else
          res.body =  path.match(/api\/v1\/users\/search/)?
          Api::V1::UsersController.search(params)
          :
          Api::V1::UsersController.index(query)
        end
      when "POST"
      when "PUT"

      when "DELETE"

      else

    end
  rescue => e
    p e.backtrace
    p e.message
    res.body = e.message
  end
end

s.mount_proc '/api/v1/articles' do |req, res|
  begin
    path = req.path
    query = req.query
    params = { id: path.split("/")[-1] }.merge(query)

    case req.request_method
      when "GET"
        if path.match(/api\/v1\/articles\/[0-9]\/is_logined/)
          return nil
        end
        if path.match(/api\/v1\/articles\/[0-9]/)
          res.body = API::V1::ArticlesController.show(params)
        else
          res.body = API::V1::ArticlesController.index(query)
        end
      when "POST"

      when "PUT"

      when "DELETE"

      else

    end
  rescue => e
    p e.backtrace
    p e.message
    res.body = e.message
  end
end

s.mount_proc '/users' do |req, res|
  begin
    path = req.path
    query = req.query
    params = { id: path.split("/")[-1] }.merge(query)

    case req.request_method
      when "GET"
        if path.match(/users\/[0-9]\/is_logined/)
          return nil
        end
        if path.match(/users\/[0-9]/)
          res.body = UsersController.show(params)
        else
          res.body = UsersController.index(query)
        end

      when "POST"

      when "PUT"

      when "DELETE"

      else
      
    end
  rescue => e
    p e.backtrace
    p e.message
    res.body = e.message
  end
end

s.mount_proc '/articles' do |req, res|
  begin
    path = req.path
    query = req.query
    params = { id: path.split("/")[-1] }.merge(query)

    case req.request_method
      when "GET"
        if path.match(/articles\/[0-9]\/is_logined/)
          return nil
        end
        if path.match(/articles\/[0-9]/)
          res.body = ArticlesController.show(params)
        else
          res.body = ArticlesController.index(query)
        end

      when "POST"

      when "PUT"

      when "DELETE"

      else
      
    end
  rescue => e
    p e.backtrace
    p e.message
    res.body = e.message
  end
end

s.start
