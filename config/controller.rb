require "erb"

class Controller
  def self.render(erb,response_type=nil)
    ERB.new(erb).result(binding)
  end
end