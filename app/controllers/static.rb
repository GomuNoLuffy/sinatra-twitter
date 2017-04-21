get '/' do
  if logged_in? 
   	erb :"static/main"
  else 
	erb :"static/index" 
  end
end

get '/main' do
	erb :"static/main"
end
