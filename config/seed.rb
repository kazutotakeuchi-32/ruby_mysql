require "mysql2"

client = Mysql2::Client.new(host: "localhost", username: "root", password: 'yes', database: 'test')


client.query("""
  SELECT * FROM USERS ;
  """)