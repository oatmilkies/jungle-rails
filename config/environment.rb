# Load the Rails application.
require_relative "application"
require 'logger'

# Initialize the Rails application.
Rails.application.initialize!

log = Logger.new(STDOUT)
error_log = Logger.new(STDERR)
error_log = error_log.error("fatal error")