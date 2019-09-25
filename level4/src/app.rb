require 'sinatra'
def get_todos
  @@todos ||= []
end

def get_todo
	id=@id.to_i
  get_todos()[id - 1]
end

def update_todo(title)
	id=@id.to_i
  get_todos()[id - 1] = {title=>get_todos()[id-1].values[0]}
end

def add_todo(todo, deadline)
  get_todos().push({todo=>deadline})
end

get "/todos" do
  @todos = get_todos()
  erb :todos
end

get "/todos/:id" do
  @id = params[:id]
  @todo = get_todo()
  erb :todo
end

post "/todos" do
  add_todo(params[:title], params[:date1])
  redirect "/todos"
end

put "/todos/:id" do
  @id = params[:id]
  update_todo(params[:title])
  redirect "/todos"
end

def delete_todo
	id=@id.to_i
  get_todos().slice!(id - 1)
end

delete "/todos/:id" do
  @id = params[:id]
  delete_todo()
  redirect "/todos"
end