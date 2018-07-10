require('pg')

class Bounty

  attr_writer :bounty_value

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @bounty_value = options['bounty_value'].to_i
    @favourite_weapon = options['favourite_weapon']
    @homeworld = options['homeworld']
  end

  def save
    db = PG.connect ({dbname: 'bounty_hunters', host: 'localhost'})
    sql = "INSERT INTO bounty (name, bounty_value, favourite_weapon, homeworld) VALUES ($1, $2, $3, $4) RETURNING *;"
    values = [@name, @bounty_value, @favourite_weapon, @homeworld]
    db.prepare("save", sql)
    returned_hashes = db.exec_prepared("save", values)
    @id = returned_hashes.first['id'].to_i
    db.close()
  end

  def update
    db = PG.connect ({dbname: 'bounty_hunters', host: 'localhost'})
    sql = "UPDATE bounty SET bounty_value = $1 WHERE id = $2;"
    values = [@bounty_value, @id]
    db.prepare("update", sql)
    db.exec_prepared("update", values)
    db.close()
  end

  def delete
    db = PG.connect ({dbname: 'bounty_hunters', host: 'localhost'})
    sql = "DELETE FROM bounty WHERE id = $1;"
    values = [@id]
    db.prepare("delete", sql)
    db.exec_prepared("delete", values)
    db.close()
  end

  def Bounty.find_by_name(name)
    db = PG.connect ({dbname: 'bounty_hunters', host: 'localhost'})
    sql = "SELECT * FROM bounty WHERE name = $1;"
    values = [name]
    db.prepare("find_by_name", sql)
    bounty_array_of_hash = db.exec_prepared("find_by_name", values)
    db.close()
    bounty = bounty_array_of_hash.map {
      |hash| Bounty.new(hash)
    }
    return bounty
  end

  def Bounty.find_by_id(id)
    db = PG.connect ({dbname: 'bounty_hunters', host: 'localhost'})
    sql = "SELECT * FROM bounty WHERE id = $1;"
    values = [id]
    db.prepare("find_by_id", sql)
    bounty_array_of_hash = db.exec_prepared("find_by_id", values)
    db.close()
    bounty = bounty_array_of_hash.map {
      |hash| Bounty.new(hash)
    }
    return bounty
  end

end
