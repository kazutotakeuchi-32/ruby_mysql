require "/Users/takeuchikazuto/project/ruby_mysql/config/db.rb"

class Article < MyActiveRecord
  @@table_name = "articles"
  def initialize(title,content,user_id)
    @title = title
    @content = content
    @user_id = user_id
  end

  def search(keyword,column=nil)
    if column.nil?
      self.query("SELECT * FROM #{@@table_name} WHERE title OR  content OR email  LIKE '%#{keyword}%'")
    else
      self.query("SELECT * FROM #{@@table_name} WHERE #{keyword} LIKE '%#{keyword}%'")
    end
  end

  def user
    @@table_name = "users"
    result = User.where("id=#{@user_id}")
    @@table_name = "articles"
    result
  end

  def likes
    @@table_name = "likes"
    result = Like.where("article_id=#{@id}")
    @@table_name = "articles"
    result
  end

end

