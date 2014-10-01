require "sinatra"
require "sinatra/activerecord"
 
set :database, "sqlite3:///blog.db"
 
class Post < ActiveRecord::Base
end

get "/" do
  @posts = Post.all
  erb :"posts/index"
end

get "/posts/new" do
  @title = "New Post"
  @post = Post.new
  erb :"posts/new"
end

post "/posts" do
  @post = Post.new(params[:post])
  if @post.save
    redirect "posts/#{@post.id}"
  else
    erb :"posts/new"
  end
end

get "/posts/:id" do
  @post = Post.find(params[:id])
  @title = @post.title
  erb :"posts/show"
end

get "/posts/:id/edit" do
  @post = Post.find(params[:id])
  @title = "Edit Form"
  erb :"posts/edit"
end

put "/posts/:id" do
  @post = Post.find(params[:id])
  if @post.update_attributes(params[:post])
    redirect "/posts/#{@post.id}"
  else
    erb :"posts/edit"
  end
end

delete "/posts/:id" do
  @post = Post.find(params[:id]).destroy
  redirect "/"
end
