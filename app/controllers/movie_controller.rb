class MovieController < ApplicationController
    @@api_url='http://www.omdbapi.com/?t='
    def index
        @movie_list = List.all
    end
    
    def new_movie
        require('json')
        require('open-uri')
        
        movie_info = []
        title = params[:title]
        temp_url = @@api_url + title
        info_page = open(temp_url)
        data = info_page.read
        movie_info = JSON.parse(data)
        
        new =List.new
        new.title = title
        new.director = movie_info["Director"]
        new.genre = movie_info["Genre"]
        new.poster = movie_info["Poster"]
        new.save
        
        redirect_to '/'
    end
    
    def delete
        delete_list = List.find(params[:id])
        delete_list.destroy
        
        redirect_to '/'
    end
    
    def edit
        edit_list = List.find(params[:id])
        genre = params[:genre]
        edit_list.genre = genre
        director = params[:director]
        edit_list.director = director
        edit_list.save
        
        redirect_to '/'
    end
end
