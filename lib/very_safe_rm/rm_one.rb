module VerySafeRm
  # TODO
  module RM
    def self.rm_one(file, args)
      if Dir.empty? file then RM.do_rm file, ['-rfv']
      elsif File.empty? file then RM.do_rm file, ['-fv']
      else RM.do_rm file, ['-iv', *args]
      end
    end

    def self.do_rm(file, args)
      `rm #{args.join ' '} #{file}`
    end
  end
end
