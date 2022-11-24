class SpicesController < ApplicationController

    # GET /spices: return an array of all spices
    def index
        spices = Spice.all 
        render json: spices
    end

    # POST /spices: create a new spice
    def create
        spice = Spice.create(spice_params)
        render json: spice, status: :created
    end

    # PATCH /spices/:id: update an existing spice
    def update
        spice = Spice.find_by(id: params[:id])
        if spice
            spice.update(spice_params)
            render json: spice
        else
            render json: { error: "Spice not found" }, status: :not_found
        end
    end

    # DELETE /spices/:id: delete an existing spice
    def destroy
        spice = Spice.find_by(id: params[:id])
        spice.destroy
        head :no_content
    end

    private

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end
end
