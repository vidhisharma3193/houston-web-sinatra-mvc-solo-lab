class PuppiesController < ApplicationController

  get '/puppies' do #displays all the puppies  1. See all the puppies on index page
    @puppies = Puppy.all
    erb :index         #   2. Click on the link from the index page to see individual puppy

  end


  get '/puppies/new' do
    erb :new
  end

  get '/puppies/:id' do
    @puppy = Puppy.find(params[:id])
    # binding.pry

    erb :puppy
  end

  post '/puppies' do # creates a puppie
        # binding.pry
        Puppy.create(params)
        redirect  '/puppies'
    end

  get '/puppies/:id/edit' do
    @puppies = Puppy.find(params[:id])
    erb :edit
  end


    patch '/puppies/:id' do #edits a puppy
        puppies = Puppy.find(params[:id])
        # binding.pry
        puppies.update(name: params[:name], breed: params[:breed])
        redirect "/puppies/#{params[:id]}"
    end

    delete '/puppies/:id' do #destroy a puppy
            puppy = Puppy.find(params[:id])
            puppy.destroy
            redirect "/puppies"
        end

end
