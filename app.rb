class Search < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  use Rack::Session::Cookie, :key => 'rack.session',
      :expire_after => 2592000,
      :secret => SecureRandom.hex(64)

=begin
  use OmniAuth::Builder do
    provider :google_auth2, ENV['GOOGLE_CLIENT_ID'], ENV["GOOGLE_CLIENT_SECRET"],
             {
                 :name => 'google',
                 :prompt => 'select_account',
                 :scopes => 'email, plus.login',
                 :image_aspect_ratio => 'square',
                 #:image_size => 300,
             }
  end
=end


  # SEQUEL Documentation for databases
  # http://sequel.jeremyevans.net/rdoc/files/doc/cheat_sheet_rdoc.html
  get '/' do
    #params[:key] => :value
    # - url args
    # - header/form
    # - query string

    #@colleges = College.where(:name => params[:userInput])
    #puts @colleges.inspect

    erb :index
  end

  get '/submit' do
    @colleges = College.where(:name => params[:userInput])
    # @colleges.select(:name => params[:userInput])
    # @colleges = DB[:name].select(:name => params[:userInput])
    # puts @colleges.inspect

    # puts @colleges[:address]

=begin
    @colleges.each do |x|
      puts x[:name]
      puts x[:address]
      puts x[:city]
    end
=end

    # return @colleges #=> @values={:__id__=>1018, :name=>"Brown University", :address=>"Prospect St", :city=>"Providence", :state=>"RI", :zipcode=>"\"02912\"", :phone=>"401-863-1000"}>
    erb :search_results

  end

  get '/profile' do
    erb :profile
  end

end


# Elastic Search
# https://www.elastic.co
# https://github.com/elastic/elasticsearch-ruby/blob/master/elasticsearch-api/README.md

#Casecommons Search
# https://github.com/Casecommons/pg_search