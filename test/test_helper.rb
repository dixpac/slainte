$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "byebug"
require "slainte"

require "minitest/autorun"

def read_file(filename)
  filepath =  File.expand_path("../fixtures/files/#{filename}", __FILE__)
  File.read(filepath)
end
