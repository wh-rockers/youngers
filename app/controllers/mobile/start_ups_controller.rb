class Mobile::StartUpsController < Mobile::ApplicationController
  before_action :sign_in_via_open_id, only: [:index]

  def index
  end

  def new
  end
end