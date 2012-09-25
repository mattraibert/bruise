require 'highline/import'

module Bruise
  def self.help
    puts """
#{'uninstall:'.ljust 15} asks which packages to uninstall and tries to do it
#{'upgrade:'.ljust 15} asks which packages to upgrade and tries to do it
#{'deps:'.ljust 15} list all deps
"""
  end
  
  def self.uninstall
    bruises = `brew list`.split("\n")
    bruises = bruises.select {|bruise| /^y/ =~ ask("uninstall #{bruise}?") }
    bruises.each { |bruise| puts `brew uninstall #{bruise}` }
  end

  def self.upgrade
    bruises = `brew outdated`.split("\n")
    bruises = bruises.select { |bruise| /^y/ =~ ask("upgrade #{bruise}?") }
    bruises.each {|bruise| puts `brew upgrade #{bruise}` }
  end

  def self.deps
    bruises = `brew list`.split("\n")
    bruises.each do |bruise|
      deps = `brew deps #{bruise}`.split("\n").join(", ")
      puts "#{bruise} => [#{deps}]"
    end
  end
end







