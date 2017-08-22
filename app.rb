require 'sinatra'
enable :sessions 

get '/' do
    erb :index
end 

post '/toppings' do
    session[:options] = params[:choices]
redirect '/confirm'
end 

get '/confirm' do
    erb :confirm, locals: {choices: session[:options]}
end

post "/confirm" do
    session[:confirmchoices] = params[:confirmed_options]
    redirect '/results'
end

get '/results' do
    erb :results, locals: {results: session[:confirmchoices]}
end 