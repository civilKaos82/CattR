get '/' do
  erb :'index.html'
end

post '/search' do
  @search_string = params[:search]
  @results = GiphyAdapter.new.search(@search_string)
  erb :"results.html"
end
