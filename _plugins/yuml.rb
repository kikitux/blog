require 'fileutils'
require 'digest/md5'

module Jekyll
  class YUmlBlock < Liquid::Block
    def initialize(tag_name, options, tokens)
      super

      yuml_exists = system('which yuml > /dev/null 2>&1')

      # There is always a blank line at the beginning, so we remove to get rid
      # of that undesired top padding in the yuml output
      yuml = @nodelist.to_s
#      yuml.gsub!('\n', "\n")
#      yuml.gsub!(/^$\n/, "")
#      yuml.gsub!(/^\[\"\n/, "")
#      yuml.gsub!(/\"\]$/, "")
#      yuml.gsub!(/\\\\/, "\\")

      hash = Digest::MD5.hexdigest(@nodelist.to_s + options)
      yuml_home = 'images/yuml/'
      FileUtils.mkdir_p(yuml_home)
      @png_name = yuml_home + 'yuml-' + hash + '.png'

      if yuml_exists
        if not File.exists?(@png_name)
          args = ' ' + options
          File.open('/tmp/yuml-foo.txt', 'w') {|f| f.write(yuml)}
          @png_exists = system('yuml -i /tmp/yuml-foo.txt -o ' + @png_name + args)
        end
      end
      @png_exists = File.exists?(@png_name)
    end

    def render(context)
      if @png_exists
        '<figure><img src="/' + @png_name + '" /></figure>'
      else
        '<code><pre>' + super + '</pre></code>'
      end
    end
  end
end
 
Liquid::Template.register_tag('yuml', Jekyll::YUmlBlock)
