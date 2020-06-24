class CandidatesController < ApplicationController
    def index
        @candidates = Candidate.all
    end
    def new
        @candidate = Candidate.new
    end    
    def create
        @candidate = Candidate.new(clean_params)

        if @candidate.save
            flash[:notice] = "Candidate created!"
            redirect_to '/candidates'
        else
            flash[:notice] = "Please fill the blank!"            
            render :new
        end
    end

    private
    def clean_params
        params.require(:candidate).permit(:name, :party, :age, :politics)
    end

end
