def replace_account_sid(file_path)
  file = File.open(File.expand_path(file_path), 'r')
  original = file.read
  replaced = original.gsub(/AC\w{32}/, 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
  replaced = replaced.gsub('{AuthToken}', '{{ auth_token }}')

  unless original == replaced
    # puts replaced
    File.open(File.expand_path(file_path), 'w') { |document| document.write(replaced) }
  end

  file.close
rescue
  puts "Error replacing content in file: #{file_path}"
end

Dir.glob("**/*") do |file|
  next if file.include?('snippet-testing') || file.include?('nuget/') || file.include?('vendor/')
  replace_account_sid(file) unless File.directory?(file)
end