get '/users/new' do
  erb :'users/new'
end

post '/users/new' do
  new_account = User.new(
    username: params[:username],
    email: params[:email],
    password: params[:password]
    )
  if params[:password] == params[:password2] && params[:password].length > 5

    if new_account.save
      @user = User.find_by(id: session[:user_id])
      p @user
      session[:user_id] = new_account.id
      erb :index
    else
      @errors = new_account.errors.full_messages
      erb :'users/new'
    end

  else
    new_account.validate
    @errors = new_account.errors.full_messages
    @errors << "Invalid Passwords: Must Match And Have 6 or More Characters"
    erb :'users/new'
  end
end

get '/users/:id' do
  @user = User.find_by(id: session[:user_id])
  erb :'users/show'
end
