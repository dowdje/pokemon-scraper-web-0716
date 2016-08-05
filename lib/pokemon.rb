class Pokemon
  attr_reader :id, :name, :type, :db
  def initialize(id = nil, name, type, db)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(poke_name, poke_type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES (?, ?)", poke_name, poke_type)
  end

  def self.find(id, db)
    db.execute("SELECT * FROM pokemon WHERE id = ?", id)
  end

  def alter_hp(new_hp)
    @db.execute("UPDATE pokemon SET hp = ? WHERE name = ?", new_hp, self.name)
  end


end
