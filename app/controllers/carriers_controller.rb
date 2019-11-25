class CarriersController < ApplicationController

  def new
    @carrier = Carrier.new
  end

  def create
    @carrier = Carrier.new(carrier_params)
    @carrier.save
    redirect_to carrier_index_path(@carrier)
  end

  private

  def shipper_params
    params.require(:carrier).permit(:first_name, :last_name, :email, :password, :CNPJ,
      :job_title, :company_name, :user_type)
  end
end