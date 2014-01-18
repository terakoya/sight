require 'digest/md5'
class CaptureJob
  RASTERIZE_JS = Rails.root.join('lib/js/rasterize.js').to_s
  def capture(url: )
    file_path = "#{Digest::MD5.hexdigest(url)}_#{Time.now.to_i}.png"
    system 'phatomjs', RASTERIZE_JS, url, file_path
  end
end
