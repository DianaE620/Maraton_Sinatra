before "/profile/:id" do
  unless session[:id]
    redirect to("/?error=1")
  end
end

get "/login" do
  erb :login
end

post "/login" do
  user = params[:nombre]
  password = params[:pass]

  p user = User.find_by(name: user, pass: password) 

  if user == nil   
    @error = 1
    erb :login
  else
    @id = user.id
    session[:id] = @id
    redirect to("/profile/#{@id}")
  end

end

get '/destruir' do
  session.clear
  redirect to("/")
end