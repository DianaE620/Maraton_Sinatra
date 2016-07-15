get "/game/:deck" do 
    
  @deck = params[:deck]
  
  @ques = Deck.find_by(name: @deck).cards
  session[:deck] = @deck

  erb :game
end

post "/respuestas" do

  @respuestas = params[:responses].split(",")
  right = 0
  wrong = 0
  user = session[:id]
  @deck_name = session[:deck]
  @questions = Deck.find_by(name: @deck_name).cards

  for i in 0...@respuestas.length
    if @respuestas[i] == @questions[i].answer3
      right += 1
    else
      wrong += 1
    end
  end

  @round = Round.new(wrong: wrong, right: right)

  if @round.save
    Deck.find_by(name: session[:deck]).rounds << @round
    p @user = User.find(user)
    @user.rounds << @round 
    p @round
  else
    p @error = "error"
  end

    
  erb :_ronda, layout: false
end

# get "/respuestas/:r" do
#   p respuestas = params[:r].split(",")

#   erb :ronda
# end


 # t.integer :right
 #      t.integer :wrong
 #      t.timestamps
 #      t.belongs_to :deck, index: true
 #      t.belongs_to :user, index: true


