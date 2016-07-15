get "/profile/:id" do
  @id = params[:id]
  @user = User.find(@id)
  @decks = Deck.all
  erb :profile
end

get "/stadistics/:id" do
  p id = params[:id]
  p @user = User.find(id)
  p @rounds = @user.rounds

  erb :stadistics
end



