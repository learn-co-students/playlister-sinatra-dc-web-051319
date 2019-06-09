# frozen_string_literal: true

require './config/environment'

begin
  fi_check_migration

  use Rack::MethodOverride
  use SongsController
  use ArtistsController
  use GenresController
  run ApplicationController
rescue ActiveRecord::PendingMigrationError => e
  warn e
  exit 1
end
