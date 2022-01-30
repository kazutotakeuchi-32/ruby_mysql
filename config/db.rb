require "mysql2"

class MyActiveRecord
  @@table_name = "users"
  @@client = Mysql2::Client.new(host: "localhost", username: "root", password: 'yes', database: 'test')

  def self.query(sql)
    @@client.query(sql)
  end

  def self.find(query)
    @@client.query("SELECT * FROM #{@@table_name} WHERE id = #{query} ")
  end

  def self.where(query)
    @@client.query("SELECT * FROM #{@@table_name} where #{query}")
  end

  def self.create(hash)
    keys = hash.keys.map{|k| k.to_s}.join(",")
    values = (hash.values.map do |h|
      h.instance_of?(String) ? "'"+ h + "'" : h
    end).join(",")
    @@client.query("INSERT INTO #{@@table_name} (#{keys}) VALUES (#{values}) ")
    rescue => e
      puts e
  end

  def save
    if @id.nil?
      @@client.query("INSERT INTO #{@@table_name}  (#{set_column}) VALUES (#{set_value}) ")
    else
      update()
    end 
    rescue => e
      puts e
  end

  def update
    @@client.query("UPDATE #{@@table_name} #{set_key_and_value()} WHERE id=#{@id}")
    rescue => e
      puts e
  end

  def destroy
    @@client.query("DELETE  FROM  #{@@table_name} WHERE id=#{@id}")
    rescue => e
      puts e
  end

  def set_column
    i=0
   ( instance_variables.map do |c|
      column = c.to_s.gsub(/@/,"") 
    end)[1..].join(",")
  end

  def set_value
    (instance_variables.map do |c|
      column = instance_variable_get(c)
      column.instance_of?(String) ? "'"+column + "'" : column 
    end).join(",").slice(1..)
  end

  def set_key_and_value
    instance_variables.map{|k,v| "#{k}=#{v}" }.join(",")
  end

end



# client = MyActiveRecord.new

# client = Mysql2::Client.new(host: "localhost", username: "root", password: 'yes', database: 'test')

# result  = client.query("SELECT * FROM users ;")
# result = client.find(1)

# result.each { |row|
#   puts row["id"]
#   puts row["firstname"]
# }
