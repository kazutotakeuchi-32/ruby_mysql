require "/Users/takeuchikazuto/project/ruby_mysql/config/db.rb"

class Like < MyActiveRecord
  @@table_name = "users"

  def initialize(user_id, article_id)
    @user_id = user_id
    @article_id = article_id
  end

  def users
    @@table_name = "users"
    result = Article.where("user_id=#{@user_id}")
    @@table_name = "articles"
    result
  end

  def articles
    @@table_name = "articles"
    result = Article.where("user_id=#{@id}")
    @@table_name = "likes"
    result
  end

end