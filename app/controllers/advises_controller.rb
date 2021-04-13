class AdvisesController < ApplicationController
    def show
        @advise = Advise.where( 'id >= ?', rand(Advise.first.id..Advise.last.id) ).first
    end
    # def index
    # end

    # def new
    # end

    # def create
    #     advise = Advise.create(params[:body])
    #     # advise.user_id = current_user.id
    # end

    # def edit
    # end

    # def update
    # end

    # def destroy
    # end
end
