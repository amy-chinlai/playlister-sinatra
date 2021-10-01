require './config/environment'

begin
  fi_check_migration


  run ApplicationController
rescue ActiveRecord::PendingMigrationError => err
  STDERR.puts err
  exit 1
end
use Rack::MethodOverride
use GenresController
use ArtistsController
use SongsController
run ApplicationController


