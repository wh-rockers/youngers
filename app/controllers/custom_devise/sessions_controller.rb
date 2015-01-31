class CustomDevise::SessionsController < Devise::SessionsController
  def new
    @qr = RQRCode::QRCode.new(Weixin::QrUrl.new.qr_url, size: 6).to_img.resize(120, 120).to_data_url
    super
  end
end