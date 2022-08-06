class ApiController < ActionController::API
  private

  def page
    params[:page] || 1
  end

  def per_page
    params[:per_page] || 25
  end
end
