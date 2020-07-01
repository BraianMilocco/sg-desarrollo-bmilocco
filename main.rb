require 'sinatra'
require 'rubygems'
require 'bundler/setup'
require 'json'
require './palindromos'

require "sinatra/base"
require "sinatra/json"




class BuscadorMagico < Sinatra::Base
    
    get '/' do
        @title = "Buscador de Palabras Muggles"
     
        erb :homescreen
    end

    post '/hola' do
        palabrasRecibidas = JSON.parse(request.body.read)

        @encontrarPalindromos= MuggleWords.new(palabrasRecibidas['palabras'])

        @wordsMuggles= @encontrarPalindromos.json

        json :findMugglesWords => @wordsMuggles
        
    end

end
