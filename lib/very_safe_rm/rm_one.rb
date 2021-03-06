module VerySafeRm
  module RM
    def self.rm(file, args)
      return if RM.check_bang file
      system ['/bin/rm', $PROGRAM_NAME], *args, '--', file
    end

    def self.rm_one(file, args)
      return RM.rm file, [] unless File.exist? file
      filesystem = `stat -fc %T "#{file}"`
      if filesystem == 'nilfs' then RM.rm file, ['-r', '-v', '-f']
      elsif Dir.empty? file then RM.rm file, ['-r', '-f', '-v']
      elsif File.empty? file then RM.rm file, ['-f', '-v']
      elsif RM.check_force_rm? file then RM.rm file, ['-v', *args]
      else RM.rm file, ['-i', '-v', *args]
      end
    end

    def self.check_force_rm?(file)
      return false unless File.exist? \
        File.expand_path("-#{file}.rm", File.dirname(file))
      RM.rm "-#{file}.rm", ['-r', '-f']
      true
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
