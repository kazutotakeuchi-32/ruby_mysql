require "/Users/takeuchikazuto/project/ruby_mysql/config/controller.rb"
require "/Users/takeuchikazuto/project/ruby_mysql/app/model/user.rb"

module Api
  module V1
    class UsersController < Controller
      def self.index(params=nil)
        User.all().map{|r|r}
      end
      def self.show(params=nil)
        begin
          @user = User.find(params[:id]).map{|r|r}[-1] || nil 
          raise "ユーザが存在しません！" if @user.nil?
          @user
        rescue => e
          e.message
        end
      end
      def self.create(params=nil)
      end
      def self.update(params=nil)
      end
    end
  end
end

