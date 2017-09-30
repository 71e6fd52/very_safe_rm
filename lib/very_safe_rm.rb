require 'very_safe_rm/version'
require 'very_safe_rm/rm_one'

# TODO
module VerySafeRm
  def self.run(file, args)
    file.each do |name|
      RM.rm_one name, args
    end
  end

  def self.parse(argv)
    a = argv.each_with_object(file: [], args: [], done: false) do |arg, obj|
      if obj[:done] then obj[:file] << arg
      elsif arg == '--' then obj[:done] = true
      elsif arg[0] == '-' then obj[:args] << arg
      else obj[:file] << arg
      end
    end
    [a[:file], a[:args]]
  end
end
