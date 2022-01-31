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
s.start