require "/Users/takeuchikazuto/project/ruby_mysql/config/controller.rb"

class UsersController < Controller
  def self.index(params=nil)
    html = File.read('app/views/users/index.html.erb')
    @users = User.all().map{|r|r}
    @users
    self.render(html)
  end
  def self.show(params=nil)
  end
  def self.create(params=nil)
  end
  def self.update(params=nil)
  end

  private
    def set_data(type=nil)
    end
end