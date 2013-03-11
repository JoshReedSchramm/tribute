CarrierWave.configure do |config|
  yaml_config = YAML::load(File.open("#{Rails.root}/config/amazon_s3.yml"))
  s3env = yaml_config[Rails.env] || yaml_config["default"]

  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => s3env["aws_access_key_id"],
    :aws_secret_access_key  => s3env["aws_secret_access_key"], 
    :region                 => 'us-east-1'
  }
  config.fog_directory  = s3env["bucket"]
end
