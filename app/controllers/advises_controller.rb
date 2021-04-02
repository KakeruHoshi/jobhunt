class AdvisesController < ApplicationController
    def show
        @advise = Advise.where( 'id >= ?', rand(Advise.first.id..Advise.last.id) ).first
    end
end
