require "/Users/takeuchikazuto/project/ruby_mysql/config/db.rb"

class Like < MyActiveRecord
  @@table_name = "users"

  def initialize(user_id, article_id)
    @user_id = user_id
    @article_id = article_id
  end
  
end