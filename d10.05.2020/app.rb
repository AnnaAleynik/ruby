require 'pg'
require 'sinatra'
require 'byebug'
require 'sinatra/reloader' if development?

configure {set :server, :puma}

conn = PG.connect( dbname: 'todo_app', host: 'localhost', user: 'postgres',
    password: 'postgres' )

get '/' do
	'Hello'
end

get "/todos" do

	@results = conn.exec( "SELECT * FROM todos")

	erb :index

end 

get "/todos/new" do
	erb :new
end

get "/todos/:id/edit" do
	@results = conn.exec("SELECT * FROM todos WHERE id='#{params['id']}'")[0]

  erb :edit
end

get '/todos/:id' do
  "Hello World #{params["id"]}"

  @results = conn.exec("SELECT * FROM todos WHERE id='#{params['id']}'")[0]

  erb :show
end


post '/todos' do
	if params["custom_method"] == "DELETE"
		res = conn.exec("DELETE FROM todos WHERE id=#{params['id']}")

		redirect to('/todos')
	else 
		res = conn.exec("INSERT INTO todos (title) VALUES ('#{params['title']}') RETURNING id")

		id = res[0]["id"]
		redirect to("/todos/#{id}")
	end
end

post "/todos/:id" do
	if params["custom_method"] == "PUT"
		res = conn.exec("UPDATE todos SET title='#{params['title']}'' WHERE id=#{params['id']} RETURNING id")
		id = params["id"]

		redirect to("/todos/#{id}")
	end
end
