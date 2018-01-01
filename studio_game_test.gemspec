Gem::Specification.new do |s|

s.name = "studio_game_test"
s.version = "1.0.0"
s.author = "Prabesh Amatya"
s.email = "iprabesh@hotmail.com"
s.homepage = "https://www.semo.edu"
s.summary = "This is a game. "
s.description = File.read(File.join(File.dirname(__FILE__), 'README'))
s.licenses = ['MIT']

s.files = Dir["{bin,lib,spec}/**/*"] + %w(LICENSE README)
s.executables = ['studio_game']

s.required_ruby_version = '>=1.9'
s.add_development_dependency 'rspec'
end 