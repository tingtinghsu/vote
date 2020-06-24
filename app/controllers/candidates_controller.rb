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

    def show
        @candidate = Candidate.find_by(id: params[:id])
        if @candidate.nil?
            render file: "#{Rails.root}/public/404.html", status: 404
        end
    end

    def edit
        @candidate = Candidate.find_by(id: params[:id])  
    end

    def update
        @candidate = Candidate.find_by(id: params[:id])
        if @candidate.update(clean_params)
            flash[:notice] = "Candidate updated!"
            redirect_to '/candidates'    
        else
            flash[:notice] = "Please fill the blank!"            
            render :edit
        end
    end

    def destroy
        @candidate = Candidate.find_by(id: params[:id])
        @candidate.destroy 
        flash[:notice] = "Candidate destroyed!"
        redirect_to '/candidates'         

    end
    private
    def clean_params
        params.require(:candidate).permit(:name, :party, :age, :politics)
    end

end
