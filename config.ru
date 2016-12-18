require './application'

use Rack::Static, urls: %w'/js /css /images', root: 'assets'

# uncomment in case you need basic authentication
#use Rack::Auth::Basic do |username, password|
#  Rack::Utils.secure_compare(ENV['CUBA_USER'], username)
#  Rack::Utils.secure_compare(ENV['CUBA_PASS'], password)
#end

run Cuba
