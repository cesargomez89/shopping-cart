# frozen_string_literal: true

require 'byebug'
Dir['./app/*.rb'].sort.each { |file| require file }
