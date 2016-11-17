
require 'active_record'

connection = ActiveRecord::Base.connection

sql = File.read('db/some_sql_file.sql')
statements = sql.split(/;$/)
statements.pop
ActiveRecord::Base.transaction do
	statements.each do |statement|
		connection.execute(statement)
	end
end