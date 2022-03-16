# frozen_string_literal: true

class EquipmentsController < ApplicationController
    def index
        @equipments = current_user.equipments.includes(:equipmentrepairs).includes(:repairs)
    end

    def create
        equipment = current_user.equipments.new(equipment_params)
        respond_to do |format|
            format.html do
              if equipment.save
                flash[:success] = 'Created New Equipment Succesfully!'
                redirect_to equipments_path
              else
                render :new, alert: 'Error occured!'
              end
            end
          end
    end

    def destroy
        equipment = Equipment.find(params[:id])
        equipment.destroy
        redirect_to equipments_path
        flash[:success] = 'Equipment Deleted!'
    end

    def show
        @equipments = Equipment.find(params[:id])
        @equipmentrepairs = @equipments.equipmentrepairs.order(id: :desc).includes(:repair).includes(:equipment)
    end

    def new
        @icons = [
            {   
                "image" => "car.jpg",
                "name" => "Car"
            },
            {
                "image" => "TV.jpg",
                "name" => "TV"
            },
            {
                "image" => "laptop.jpg",
                "name" => "Laptop"
            },
            {
                "image" => "fridge.jpg",
                "name" => "Fridge"
            }
        ]
    end


    private

    def equipment_params
        params.require(:data).permit(:name, :icon)
    end





end
