class ApplicationController < Sinatra::Base
    configure do
        set :views, 'app/views'
        set :method_override, true
      end
    
      get '/' do
        erb :welcome
      end

      get '/dogs' do
        @array = ["Who's a good dog?", "Sit!", "Speak!", "THEY'RE ALL SO CUTE!!!!"]
        @puppy = Puppy.all
        erb :puppies
      end
      
      get '/dogs/new-dog' do
        erb :create_pup
      end

      get '/dogs/:id' do
        @puppy = Puppy.find(params[:id])
        erb :show
      end

      post '/dogs' do
        Puppy.create(params)
        redirect '/dogs'
      end

      get '/dogs/:id/mod' do
        @puppy = Puppy.find(params[:id])
        erb :pup_mod
      end

      patch '/dogs/:id' do
        puppy = Puppy.find(params[:id])
        # binding.pry
        puppy.update(name: params[:name], breed: params[:breed])
        redirect "/dogs/#{params[:id]}"
      end

      delete '/dogs/:id' do
        puppy = Puppy.find(params[:id])
        puppy.destroy
        redirect"/dogs"
      end







    #     @puppy = Puppy.find(params[:id])
    #     erb :create_pup
    #   end
    # end

   
end
