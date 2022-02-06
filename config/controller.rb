require "erb"
require "json/add/core"

class Controller
  def self.render(erb,response_type=nil)
    ERB.new(erb).result(binding)
  end
  def self.render_json(params)
    params.to_json
  end
end