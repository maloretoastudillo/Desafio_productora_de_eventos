class ConcertsController < ApplicationController

    def index
        @concerts = Concert.all
    end

    def new
        @concert = Concert.new
        @bands = Band.all.pluck(:name, :id)
        @crew = Crew.new
    end

    def create
        @concert = Concert.create(concert_params)

        if @concert.save
            redirect_to concerts_path, notice: "El registro se ha agregado con éxito."
        else
            render :new
        end
    end

    def edit
        @concert = Concert.find(params[:id])
        @bands = Band.all.pluck(:name, :id)
    end

    def update
        @concert = Concert.find(params[:id])

        if @concert.update(concert_params)
            redirect_to concerts_path
        else
            render :edit
        end
    end

    def destroy
        @concert = Concert.find(params[:id])
        @concert.destroy

        respond_to do |format|
            format.html { redirect_to concerts_url, notice: "El registro fue destruido." }
        end
    end

    private

    def concert_params
        params.require(:concert).permit(:date, :place, :assistants, :duration, :band_id)
    end

end