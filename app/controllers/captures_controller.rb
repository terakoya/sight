class CapturesController < ApplicationController
  def show
  end

  def index
    @captures = Capture.all.order('created_at DESC')
  end
end
