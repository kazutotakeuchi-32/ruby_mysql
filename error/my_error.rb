module ErrorListModule
  def test
    "test"
  end

  class MyError < StandardError
    attr_accessor :attr
    def initialize(msg="error", attr="My value")
      @attr = attr
      super(msg)
    end
  end

  class SyntaxError < StandardError
    attr_accessor :attr
    def initialize(msg="error", attr="My value")
      @attr = attr
      super(msg)
    end
  end

  module N 
    def test
      "test2"
    end
  end

end

# begin
#   raise ErrorList::MyError.new("ff","fff")
# rescue => e
#   p e.message
# end
