class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :dispatch_user
  add_flash_types :full

  def dispatch_user
    return unless current_user
    path = new_role_path if current_user.carrier.blank? && current_user.shipper.blank?
    # path = new_shipper_path if current_user.shipper.present? && current_user.shipper.cnpj.nil?
    path = root_path if current_user.shipper.present? && request.path == root_path
    path = carriers_freights_path if current_user.carrier.present? && request.path == root_path
    redirect_to path unless path.nil? || path == request.path || !request.get?
  end
end
