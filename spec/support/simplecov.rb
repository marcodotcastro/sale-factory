require 'simplecov'

SimpleCov.start 'rails' do

  add_filter do |source_file|
    source_file.lines.count < 20
  end

  add_group "Businesses", "app/businesses"

end


