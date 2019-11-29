class Carriers::ProfilesController < ApplicationController
  def edit
    redirect_to root_path, alert: 'Invalid page' if current_user.carrier.nil?
    @carrier = current_user.carrier
  end

  def update
    @carrier = current_user.carrier
    @carrier.update(carrier_params)
    if @carrier.save
      redirect_to carriers_profile_path
    else
      render :edit
    end
  end

  def show
    @carrier = current_user.carrier
  end

  private

  def carrier_params
    params.require(:carrier).permit(:first_name, :last_name, :CNPJ, :job_title,
                                    :company_name, :carriers_type, :photo)
  end
end
