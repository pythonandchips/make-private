guard 'bundler' do
  watch('Gemfile')
  watch(/^.+\.gemspec/)
end

guard 'spork' do
  watch('Gemfile')
  watch('Gemfile.lock')
  watch(/^.+\.gemspec/)
  watch('spec/spec_helper.rb')
end

guard 'rspec', :version => 2 do
  watch(%r{^spec/models/.+\.rb}) {"spec"}
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch(%r{^spec/support/(.+)\.rb$})                  { "spec" }
  watch('spec/spec_helper.rb')  { "spec" }
end

