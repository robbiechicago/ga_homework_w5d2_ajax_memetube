require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'
require 'pry'

before do 
  @db = PG.connect(dbname: 'sinatra_memetube', host: 'localhost')
end

after do 
  @db.close
end

# home
get '/' do
  redirect to '/videos'
end

# index
get '/videos' do
  sql = 'SELECT * FROM videos'
  @vids = @db.exec(sql)
  erb :index
end

get '/videos/new' do
  erb :new
end

# show
get '/videos/:id' do
  # binding.pry
  sql = "SELECT * FROM videos WHERE id = #{params[:id]}"
  @vidurl = @db.exec(sql).first
  # WTF is that .first doing?  I know I need it but don't understand why.
  erb :player
end

# create
post '/videos' do
  sql = "insert into videos (title, dscr, url) values ('#{params[:title]}','#{params[:dscr]}','#{params[:url]}') returning *"
  @addvid = @db.exec(sql).first

  newsql = "SELECT id FROM videos WHERE url = '#{params[:url]}'"
  newid = @db.exec(newsql).first
  # binding.pry
  redirect to "/videos/#{newid['id']}"
end

# edit
get '/videos/:id/edit' do
  sql = "SELECT * FROM videos WHERE id = #{params[:id]}"
  @editvid = @db.exec(sql).first
  erb :edit
end

# update
post '/videos/:id' do
  sql = "UPDATE videos SET title = '#{params[:title]}', dscr = '#{params[:dscr]}', url = '#{params[:url]}' WHERE id = '#{params[:id]}'"
  @db.exec(sql)

  newsql = "SELECT id FROM videos WHERE url = '#{params[:url]}'"
  newid = @db.exec(newsql).first
  redirect to "/videos/#{newid['id']}"
end

# delete
post '/videos/:id/delete' do

end

















