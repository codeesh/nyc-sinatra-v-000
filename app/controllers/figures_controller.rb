class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end


  get '/figures/new' do

    erb :'figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    @figure.landmarks << Landmark.create(params[:landmark]) if params[:landmark][:name]
    @figure.titles << Title.create(params[:title]) if params[:title][:name]
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'figures/edit'
  end

  post '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
    @figure.landmarks << Landmark.create(params[:landmark]) if params[:landmark][:name]
    @figure.titles << Title.create(params[:title]) if params[:title][:name]
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end

end
