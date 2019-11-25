class ShippersController < ApplicationController
  def new
    @shipper = Shipper.new
  end

  def create
    @shipper = Shipper.new(shipper_params)
    @shipper.save
    redirect_to shipper_index_path(@shipper)
  end

  private

  def shipper_params
    params.require(:shipper).permit(:first_name, :last_name, :email, :password, :CNPJ,
      :job_title, :company_name, :user_type)
  end
end
