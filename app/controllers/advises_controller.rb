class AdvisesController < ApplicationController
    def show
        @advise = Advise.where( 'id >= ?', rand(Advise.first.id..Advise.last.id) ).first
        @user_advise = Quote.where(user_id: current_user.id)
    end
    # def index
    # end

    # def new
    # end

    def create
        quote = Quote.create({"body" => params[:body], "user_id" => current_user.id})
        redirect_to new_user_session_path
    end

    # def edit
    # end

    # def update
    # end

    # def destroy
    # end

end
