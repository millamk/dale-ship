class Shippers::ProfilesController < ApplicationController
  def edit
    redirect_to root_path, alert: 'Invalid page' if current_user.shipper.nil?
    @shipper = current_user.shipper
  end

  def update
    @shipper = current_user.shipper
    @shipper.update(shipper_params)
    if @shipper.save
      redirect_to shippers_profile_path
    else
      render :edit
    end
  end

  def show
    @shipper = current_user.shipper
  end

  private

  def shipper_params
    params.require(:shipper).permit(:first_name, :last_name, :CNPJ, :job_title,
                                    :company_name, :vol_freq)
  end
end
