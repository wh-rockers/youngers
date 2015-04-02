class StartUp < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :name, :logo_url, :desc
  validates_uniqueness_of :name

  def logo(version='normal')
    return nil if logo_url.nil?
    if version =~ /\d/
      "#{ENV['QINIU_URL']}#{logo_url}?imageView2/1/w/#{version}/h/#{version}"
    elsif version == 'small'
      "#{ENV['QINIU_URL']}#{logo_url}?imageView2/1/w/60/h/60"
    else
      "#{ENV['QINIU_URL']}#{logo_url}?imageView2/1/w/70/h/70"
    end
  end
end
