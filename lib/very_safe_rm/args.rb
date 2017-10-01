module VerySafeRm
  module Arg
    def self.parse(argv)
      a = argv.each_with_object(file: [], args: [], done: false) do |arg, obj|
        if obj[:done] then obj[:file] << arg
        elsif arg == '--' then obj[:done] = true
        elsif arg[0] == '-' then obj[:args].push(*Arg.arg(arg))
        else obj[:file] << arg
        end
      end
      [a[:file], a[:args]]
    end

    private_class_method

    def self.arg(arg)
      return [] unless arg[0] == '-'
      return [arg] if arg[1] == '-'
      arg[1..-1].each_char.each_with_object([]) { |a, obj| obj << "-#{a}" }
    end
  end
end
