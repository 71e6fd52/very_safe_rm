module VerySafeRm
  # TODO
  module RM
    def self.do_rm(file, args)
      return if RM.check_bang file
      system "rm #{args.join ' '} #{file}"
    end

    def self.rm_one(file, args)
      filesystem = `stat -fc %T #{file}`
      if filesystem == 'nilfs' then RM.do_rm file, ['-rvf']
      elsif Dir.empty? file then RM.do_rm file, ['-rfv']
      elsif File.empty? file then RM.do_rm file, ['-fv']
      else RM.do_rm file, ['-iv', *args]
      end
    end

    def self.check_bang(file)
      file.reverse.each_char do |char|
        return false unless char == '!'
        STDERR.print "Did you really want to delete `#{file}? [y/N] "
        return true unless STDIN.gets =~ /^y(es)?$/i
      end
    end
  end
end
