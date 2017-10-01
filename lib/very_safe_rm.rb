require 'very_safe_rm/version'
require 'very_safe_rm/rm_one'
require 'very_safe_rm/args'

# TODO
module VerySafeRm
  def self.run(file, args)
    file.each do |name|
      RM.rm_one name, args
    end
  end
end
