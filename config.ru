require './application'

use Rack::Static, urls: %w'/js /css /images', root: 'assets'

run Cuba
