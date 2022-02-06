require "erb"
require "json/add/core"

class Controller
  def self.render(params,response_type=nil)
    case response_type
    when :xml
      # xml
    when :json
      self.render_json(params)
    when :html 
      ERB.new(erb).result(binding)
    else
      ERB.new(erb).result(binding)
    end
  end
  def self.render_json(params)
    params.to_json
  end
end