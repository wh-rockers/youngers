class StartUp < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :logo_url, :name, :desc
end
