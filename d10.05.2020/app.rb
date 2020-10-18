require 'pg'
require 'sinatra'
require 'byebug'
require 'sinatra/reloader' if development?
require './todo.rb'


configure {set :server, :puma}



# main page
get '/' do
	'Hello'
end

# show all todos
get "/todos" do	
	@results = ToDo.all
	erb :index

end 

# show input new todo
get "/todos/new" do
  erb :new
end




# show edit-input todo
get "/todos/:id/edit" do
	# @results = conn.exec("SELECT * FROM todos WHERE id='#{params['id']}'")[0]

	@results = ToDo.where({"id" => params['id']})[0]
  erb :edit
end



get '/todos/:id' do
  "Hello World #{params["id"]}"

  # @results = conn.exec("SELECT * FROM todos WHERE id='#{params['id']}'")[0]

	@results = ToDo.where({"id"=>params['id']})[0]
  erb :show
end



post '/todos' do
	if params["custom_method"] == "DELETE"
		
		todo = ToDo.new(params['id'], params['title'])
		todo.delete

    redirect to('/todos')
	else 
		todo = ToDo.new(params['id'], params['title'])
		id = todo.save
		redirect to("/todos/#{id}")
	end
end


post "/todos/:id" do
	if params["custom_method"] == "PUT"

		todo = ToDo.new(params['id'], params['title'])
		id = todo.update
		
		redirect to("/todos/#{id}")
	end
end
