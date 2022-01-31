require "/Users/takeuchikazuto/project/ruby_mysql/config/controller.rb"
require "/Users/takeuchikazuto/project/ruby_mysql/app/model/article.rb"



class ArticlesController < Controller
  def self.index(params=nil)
    html = File.read('app/views/articles/index.html.erb')
    @articles = Article.all().map{|r|r}
    p@articles
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