require "/Users/takeuchikazuto/project/ruby_mysql/config/db.rb"
require "/Users/takeuchikazuto/project/ruby_mysql/app/model/article.rb"
require "/Users/takeuchikazuto/project/ruby_mysql/app/model/like.rb"

class User < MyActiveRecord
  @@table_name = "users"
  @errors = []

  def initialize(firstname,lastname,email,age,location,id=nil)
    @id = id
    @firstname = firstname
    @lastname  = lastname
    @email = email 
    @age = age
    @location =location
  end

  def self.search(keyword,column=nil)
    begin
      @@table_name = "users"
      if column.nil?
        self.query("SELECT * FROM #{@@table_name} WHERE firstname OR  lastname OR email LIKE '%#{keyword}%'")
      else
        self.query("SELECT * FROM #{@@table_name} WHERE #{column} LIKE '%#{keyword}%'")
      end
    rescue => e
      e.message
    end
  end

  def articles
    @@table_name = "articles"
    result = Article.where("user_id=#{@id}")
    @@table_name = "users"
    result
  end

  def likes
    @@table_name = "likes"
    result = Like.where("user_id=#{@id}")
    @@table_name = "users"
    result
  end

  def self.all
    @@table_name = "users"
    @@client.query("SELECT * FROM #{@@table_name}")
  end

  def self.find(id)
    begin
      @@table_name = "users"
      @@client.query("SELECT * FROM #{@@table_name} WHERE id = #{id} ")
    rescue => e
      p e.message
    end
  end


end

# first = User.first

# user=User.new(
#   "test2", 
#   "test2",
#   "test@test.com",
#   20,
#   "JP",
#   1
# )

# puts user.articles.map{|f|f}
# puts user.likes.map{|f|f}


# puts first
# result= User.find(10)
# # result.each{|result| p result}

# User.create({
#   firstname:"test2", 
#   lastname:"test2",
#   email:"test@test.com",
#   age: 20,
#   location: "JP"
# })

# # u = User.new("test1","test1","test@test.com",10,"JP")

# # u.save()

# # p u.set_column()
# # p u.set_value