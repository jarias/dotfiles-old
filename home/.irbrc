require 'irb/completion'
require 'irb/ext/save-history'

# where history is saved
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-history"
# how many lines to save
IRB.conf[:SAVE_HISTORY] = 1000

def copy(str)
  IO.popen('pbcopy', 'w') { |f| f << str.to_s }
end

def paste
  `pbpaste`
end

# detects a rails console, cares about version
def rails?(*args)
    version=args.first
    v2 = ($0 == 'irb' && ENV['RAILS_ENV']) 
    v3 = ($0 == 'script/rails' && Rails.env) 
    version == 2 ? v2 : version == 3 ? v3 : v2 || v3 
end

# loading rails configuration if it is running as a rails console
load File.dirname(__FILE__) + '/.railsrc' if rails?
