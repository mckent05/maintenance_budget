class RepairsController < ApplicationController
  before_action :authenticate_user!
  def create
    repair = current_user.repairs.new(name: repair_params[:name], amount: repair_params[:amount])
    equipment = Equipment.find(repair_params[:equipment_id])
    Equipmentrepair.create(equipment:, repair:)
    respond_to do |format|
      format.html do
        if repair.save
          flash[:success] = 'New Repair Added Succesfully!'
          redirect_to equipment_path(equipment.id)
        else
          render :new, alert: 'Error occured!'
        end
      end
    end
  end

  def new
    @equipments = current_user.equipments
  end

  def destroy
    repair = Repair.find(params[:id])
    equipment_repair = Equipmentrepair.find_by(repairs_id: repair.id)
    equipment_id = equipment_repair.equipment_id
    repair.destroy
    redirect_to equipment_path(equipment_id)
    flash[:success] = 'Repair Deleted'
  end

  private

  def repair_params
    params.require(:data).permit(:name, :amount, :equipment_id)
  end
end
