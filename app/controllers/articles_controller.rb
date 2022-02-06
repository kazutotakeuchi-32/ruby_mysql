require "/Users/takeuchikazuto/project/ruby_mysql/config/controller.rb"
require "/Users/takeuchikazuto/project/ruby_mysql/app/model/article.rb"



class ArticlesController < Controller
  def self.index(params=nil)
    html = File.read('app/views/articles/index.html.erb')
    @articles = Article.all().map{|r|r}
    self.render(html)
  end
  def self.show(params=nil)
    begin
      html = File.read('app/views/articles/show.html.erb')
      @article = Article.find(params[:id]).map{|r|r}[-1] || nil 
      raise "記事が存在しません！" if @article.nil?
      self.render(html)
    rescue => e
      e.message
    end
  end

  def self.create(params=nil)
  end
  def self.update(params=nil)
  end

  private
    def set_data(type=nil)
    end
end