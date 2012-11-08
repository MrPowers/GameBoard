# -*- encoding: utf-8 -*-
require File.expand_path('../lib/game_board/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Matthew Powers", "Elliot Shiu"]
  gem.email         = ["matthewkevinpowers@gmail.com", "elliot@sandbochs.com"]
  gem.description   = %q{This is a GameBoard class with methods to help analyze the grid.}
  gem.summary       = %q{A class to represent game boards}
  gem.homepage      = "https://github.com/MrPowers/board_gem"

  gem.files         = `git ls-files`.split($\)
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "game_board"
  gem.require_paths = ["lib"]
  gem.version       = GameBoard::VERSION
end
