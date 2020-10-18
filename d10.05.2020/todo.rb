require 'pg'
require 'sinatra'


class ToDo

  attr_reader :id, :title
  @@conn = PG.connect( dbname: 'todo_app', host: 'localhost', user: 'postgres',
    password: 'postgres' )


  def initialize(id, title)
        # @results = conn.exec( "SELECT * FROM todos")
    @id = id
    @title = title
  end

  # def initialize(hash) 
  #   hash.each_pair do |k, v|

  #   end
  # end

  def self.mapping(hash)
    hash.map do |entry|
      entry = ToDo.new(entry['id'], entry['title'])
      # entry = ToDo.new(entry)
    end
  end


  def self.all
    results = @@conn.exec("SELECT * FROM todos")
    self.mapping(results)
  end

  def self.where(params)
    id_str = ''
    title_str = ''
    method_str = ''

    if (params["meth"] == nil) 
      method_str = "SELECT * FROM todos WHERE "
    elsif (params["meth"] == 'DELETE')
      method_str = "DELETE FROM todos WHERE "
    end
      

    if (params["id"] != nil)
      id_str = "id='#{params["id"]}'"
    end

    if (params["title"] != nil)
      id_str += " and " if id_str != ''
      title_str = "title='#{params["title"]}'"
    end
        
    res = @@conn.exec("#{method_str}#{id_str} #{title_str};")
    self.mapping(res)
    # res = ToDo.new(res['id'], res['title'])
  # @results = conn.exec("SELECT * FROM todos WHERE id='#{params['id']}'")[0]

  end


  def save
    res = @@conn.exec("INSERT INTO todos (title) VALUES ('#{@title}') RETURNING id")
    puts res.class.name

    id = res[0]
    
  end


  def delete
    res = @@conn.exec("DELETE FROM todos WHERE id=#{@id}")
  end

  def update
    res = @@conn.exec("UPDATE todos SET title='#{@title}' WHERE id=#{@id} RETURNING id")
    id = @id
    # id = res    
  end


end
