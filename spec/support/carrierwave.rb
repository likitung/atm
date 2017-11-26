RSpec.configure do |config|
  # config.after(:all, :fog) do
  config.after(:all) do
    FileUtils.rm_rf CarrierWave::Uploader::Base.cache_dir
  end
end
