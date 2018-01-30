class EventsController < ApplicationController
     def show
          @event = params[:event]
          puts params[:event]
     end

end
