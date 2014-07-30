require 'pp'
require 'irb/completion'

def pbcopy(data)
  File.popen('pbcopy', 'w') { |p| p << data.to_s }
  $?.success?
end
