require "/Users/takeuchikazuto/project/ruby_mysql/config/controller.rb"
require "/Users/takeuchikazuto/project/ruby_mysql/app/model/article.rb"

module API
  module V1
    class ArticlesController < Controller
      def self.index(params=nil)
        Article.all().map{|r|r}
      end
      def self.show(params=nil)
        begin
          @article = Article.find(params[:id]).map{|r|r}[-1] || nil 
          raise "記事が存在しません！" if @article.nil?
          @article
        rescue => e
          e.message
        end
      end
      def self.create
      end
      def self.update
      end
      def self.destroy
      end
    end
  end
end