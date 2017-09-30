module VerySafeRm
  # TODO
  module RM
    def self.rm_one(file, args)
      filesystem = `stat -fc %T #{file}`
      if filesystem == 'nilfs' then RM.do_rm file, ['-rvf']
      elsif Dir.empty? file then RM.do_rm file, ['-rfv']
      elsif File.empty? file then RM.do_rm file, ['-fv']
      else RM.do_rm file, ['-iv', *args]
      end
    end

    def self.do_rm(file, args)
      puts `rm #{args.join ' '} #{file}`
    end
  end
end
