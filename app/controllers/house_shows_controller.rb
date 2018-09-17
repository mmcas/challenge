class HouseShowsController < ApplicationController
    def index
        @house_shows = HouseShow.all 
        if params[:sort].present?
            if params[:sort] == "Rating"
                @house_shows = @house_shows.sort_by { |show| show.rating }.reverse!
            elsif params[:sort] == "Release date"
                @house_shows = @house_shows.sort_by { |show| show.release_date }.reverse!
            end
        end
    end
end
