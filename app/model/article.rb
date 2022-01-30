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
end

Article.find(1)