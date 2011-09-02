# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require 'radiant-forum-extension'

Gem::Specification.new do |s|
  s.name        = "radiant-forum-extension"
  s.version     = RadiantForumExtension::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = RadiantForumExtension::AUTHORS
  s.email       = RadiantForumExtension::EMAIL
  s.homepage    = RadiantForumExtension::URL
  s.summary     = RadiantForumExtension::SUMMARY
  s.description = RadiantForumExtension::DESCRIPTION

  s.add_dependency 'radiant-reader-extension', "~> 3.0.0"
  s.add_dependency 'acts_as_list', "~> 0.1.2"

  ignores = if File.exist?('.gitignore')
    File.read('.gitignore').split("\n").inject([]) {|a,p| a + Dir[p] }
  else
    []
  end
  s.files         = Dir['**/*'] - ignores
  s.test_files    = Dir['test/**/*','spec/**/*','features/**/*'] - ignores
  # s.executables   = Dir['bin/*'] - ignores
  s.require_paths = ["lib"]

  s.post_install_message = %{
  Add this to the Gemfile in your radiant project:

    gem 'radiant-forum-extension', '~> #{RadiantForumExtension::VERSION}'

  }
end