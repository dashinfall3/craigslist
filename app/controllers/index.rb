get '/' do
  @categories = Category.all

  erb :index
end

get '/categories/:id' do
  @posts = Category.find(params[:id]).posts

  erb :category
end

post '/post' do
  new_post = Post.create(:title => params[:title], :category_id => params[:category_id], :body => params[:body], :location => params[:location], :price => params[:price], :contact_name => params[:contact_name])
  secret_key = ('a'..'z').to_a.shuffle.join
  new_post.update_attribute(:secret_key, secret_key)
  redirect '/'
end

get '/post/:id/edit' do
  @post = Post.where("secret_key = ?", params[:id]).first
  erb :post
end

post '/post/:id' do
  #update attributes from params
  post = Post.where("secret_key = ?", params[:secret_key]).first
  puts post.inspect
  post.update_attributes(:title => params[:title], :category_id => params[:category_id], :body => params[:body], :location => params[:location], :email => params[:email], :price => params[:price], :contact_name => params[:contact_name])
  content_type :json
  @post = post
  @post.to_json
end

# Sinatra's get, post, put, etc. URL helpers match against the shape/form of a URL.
# That is,
#
#   get '/:word' do
#     ...
#   end
#
# means "call this block any time we see a URL that looks like /<word>"
#
# The parts of a URL are separated by a /, so these match '/:word'
#
#   /foo, /bar, /apple+pie, /four+score+and+seven+years+ago
#
# whereas these do not match '/:word'
#
#   /, /word1/word2, /this/is/a/long/url, /articles/123
#
# This will bind whatever fits in the :word spot in the URL
# to params[:word], "as if" it were passed in via a query string
# like ?word=apples
