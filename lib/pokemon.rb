class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
    @name = name
    @type = type
    @db = db
    @id = id
  end

  def self.save(name, type, db)
    db.execute('INSERT INTO pokemon (name, type) VALUES (?, ?)', name, type)
  end 

  def self.find(id, db)
    query = db.execute("SELECT * FROM pokemon WHERE ID = ?", id)
    self.new(id: query[0][0], name: query[0][1], type: query[0][2], db: db)
  end

end
