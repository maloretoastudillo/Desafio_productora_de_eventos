class BandsController < ApplicationController

    def index
        @bands = Band.all
    end

    def show
        @band = Band.find(params[:id])
        @concerts = @band.concerts
        @crews = @band.crews.build
    end

    def new
        @band = Band.new
        @band_types = Band.band_types.keys
    end

    def create
        @band = Band.new(band_params)
        if @band.save
            redirect_to bands_path, notice: "El registro se ha agregado con éxito."
        else
            render :new
        end
    end

    def edit
        @band = Band.find(params[:id])
        @band_types = Band.band_types.keys
    end

    def update
        @band = Band.find(params[:id])

        if @band.update(band_params)
            redirect_to bands_path
        else
            render :edit
        end
    end

    def destroy
        @band = Band.find(params[:id])
        @band.destroy

        respond_to do |format|
            format.html { redirect_to bands_url, notice: "Band was successfully destroyed." }
        end
    end

    private

    def band_params
        params.require(:band).permit(:name, :members, :first_show, :band_type, crews_attributes:[:id, :name, :instrument, :_destroy])
    end
end