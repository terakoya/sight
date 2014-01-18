class OrdersController < ApplicationController
  def create
    CaptureJob.new.capture(url: params[:url])
    redirect_to captures_path
  end

  def index
  end
end
