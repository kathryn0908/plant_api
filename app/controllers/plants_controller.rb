class PlantsController < ApplicationController
    def index
        @plants = Plant.all 
        render json: @plants
    end

    def show
        @plant = Plant.find(params[:id])
        render json: @plant
    end

    def create
        @plant = Plant.create(plant_params)
        render json: @plant

    end

    def update
       @plant = Plant.find(params[:id]) 
    #    byebug
       if @plant.update(plant_params)
        render json: @plant
       else
        render json: @plant.errors.messages
       end
    end

    def destroy
        @plant = Plant.find(params[:id]) 
        @plant.destroy
        redirect_to "http://localhost:3001"
    end

    private

    def plant_params
        params.require(:plant).permit([:name, :plant_type, :location])
    end
end
