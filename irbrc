
class Object
  def puts_methods(match_this = nil, &block)
    ms = methods.sort
    if match_this
      if match_this.respond_to? :each
        match_this.each do |matcher|
          ms = ms.select {|m| m.match(matcher) } 
        end
      else
        ms = ms.select {|m| m.match(match_this) } 
      end
    end
    ms = ms.select(&block) if block_given?
    puts ms.join("\n")
  end
end

require 'irb/completion'
