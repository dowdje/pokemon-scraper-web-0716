require 'pry'
class SQLRunner
  attr_reader :db
  def initialize(db)
    @db = db
  end

  def execute_schema_migration_sql
    sql = File.read('db/schema_migration.sql')
    execute_sql(sql)
  end

  def execute_sql(sql)
     sql.scan(/[^;]*;/m).each { |line| @db.execute(line) } unless sql.empty?
  end

  def execute_create_hp_column
     sql = File.read('db/set_default_hp.sql')
      execute_sql(sql)
  end
end