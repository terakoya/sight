require 'digest/md5'
class CaptureJob
  RASTERIZE_JS = Rails.root.join('lib/js/rasterize.js').to_s
  OUT_DIR = Rails.root.join('public/captures')
  OUT_PATH = "/captures"
  Dir.mkdir(OUT_DIR.to_s) unless OUT_DIR.directory?

  def capture(url: )
    file_name = "#{Digest::MD5.hexdigest(url)}_#{Time.now.to_i}.png"
    file_path = OUT_DIR.join(file_name).to_s
    buf = IO.popen(['phantomjs', RASTERIZE_JS, url, file_path, err: :out], 'r') do |io|
      io.read
    end
    raise buf.inspect unless $?.success?

    Capture.create!(captured_url: url, image_url: "#{OUT_PATH}/#{file_name}")
  end
end
