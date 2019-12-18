require "pry"

class Pokemon
    
    attr_accessor :id, :name, :type, :db
    
    def initialize(id:, name:, type:, db:)
        @id = id 
        @name = name 
        @type = type 
        @db = db 
    end 

    def self.save(name, type, db)
        sql = <<-SQL 
        INSERT INTO pokemon (name, type)
        VALUES (?, ?)
        SQL

        db.execute(sql, name, type)
    end 

    def self.find(id, db)
        sql = <<-SQL 
        SELECT * FROM pokemon 
        WHERE id == ?
        SQL

        array = db.execute(sql, id)

        new_pokemon = self.new(id:array[0][0], name:array[0][1], type:array[0][2], db: db) 
    end 
end


