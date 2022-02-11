require "/Users/takeuchikazuto/project/ruby_mysql/config/controller.rb"
require "/Users/takeuchikazuto/project/ruby_mysql/app/model/user.rb"

class UsersController < Controller

  def self.index(params=nil)
    html = File.read('app/views/users/index.html.erb')
    @users = User.all().map{|r|r}
    @users
    self.render(html)
  end

  def self.show(params=nil)
    begin
      html = File.read('app/views/users/show.html.erb')
      @user = User.find(params[:id]).map{|r|r}[-1] || nil 
      raise "ユーザが存在しません！" if @user.nil?
      self.render(html)
    rescue => e
      e.message
    end
  end

  def self.new(params=nil)
    html = File.read('app/views/users/newhtml.erb')
    self.render(html)
  end

  def self.create(params=nil)
  end

  def self.update(params=nil)
  end

  private
    def set_data(type=nil)
    end
end