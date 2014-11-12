class RemarksController < ApplicationController
  def create
  	remark = Remark.new(permit_params)
  	respond_to do |format|
	  	if remark.save
	  		format.js
	  	end
	  end
  end

  def update
  end

  private

  def permit_params
  	params.require(:remark).permit(:content, :user_id)
  end
end
