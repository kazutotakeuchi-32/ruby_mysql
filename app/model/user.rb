require "/Users/takeuchikazuto/project/ruby_mysql/config/db.rb"

class User < MyActiveRecord
  @@table_name = "users"

  def initialize(firstname,lastname,email,age,location,id=nil)
    @id = nil
    @firstname = firstname
    @lastname  = lastname
    @email = email 
    @age = age
    @location =location
  end

  def self.search(keyword,column=nil)
    if column.nil?
      self.query("SELECT * FROM #{@@table_name} WHERE firstname OR  lastname OR email OR age OR location LIKE '%#{keyword}%'")
    else
      self.query("SELECT * FROM #{@@table_name} WHERE #{keyword} LIKE '%#{keyword}%'")
    end
  end


end

result= User.find(10)
# result.each{|result| p result}

u = User.new("test1","test1","test@test.com",10,"JP")

u.save()

# p u.set_column()
# p u.set_value