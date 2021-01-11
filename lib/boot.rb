require 'active_support/all'
require 'telegram/bot'
require 'oj'
require 'http'
require 'faker'
require 'sentimental'
require 'emoji'
require 'open-uri'
require 'nokogiri'
require 'faraday'
require 'redis'
require 'require_all'

Oj.optimize_rails

require_rel '**/*.rb'
