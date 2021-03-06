class XmlDocument
=begin
TODO: Features I'd like to implement
    [X] allow for multiple tag entries when nesting
    [X] turn attributes to strings before insertion
    [O] make indentation work for strings passed to block
=end

    attr_accessor :indents, :indent_depth

    def initialize(indents=false)
        self.indents = indents
        self.indent_depth = 0
    end

    # not useful for rspec tests
    def send(tag)
        return "<#{tag}/>"
    end

    def render_tag(tag_name, attrs={}, &block)
        #***STRING-IFY ATTRIBUTE HASH***
        # ??? is attrs an array of hashes?
        #   > NO. It's a hash with * number of entries
        # ??? do hashes have the method "map"?
        #   > YES. "Map" is an alias for "collect" both ~~> arrays

        attrs_str = attrs.map{|k, v|
            "#{k}='#{v}'"
        }.join(" ")

        # use "yield" to control "indent_depth" recursively
        xml_out = ""
        xml_out << (" " * self.indent_depth) if self.indents

        attrs == {} ? 
            xml_out << "<#{tag_name}" : 
            xml_out << "<#{tag_name} #{attrs_str}"

        if block
            self.indent_depth += 2 
            xml_out << ">"
            xml_out << "\n" if self.indents

            xml_out << yield
            self.indent_depth -= 2 

            xml_out << (" " * self.indent_depth) if self.indents
            xml_out << "</#{tag_name}>"
            xml_out << "\n" if self.indents

        else
            xml_out << "/>" 
            xml_out << "\n" if self.indents            
        end
        return xml_out
    end
    
    def method_missing(method_name, *args, &block)
        render_tag(method_name, *args, &block)
    end

    puts self.inspect + " class has been loaded..."
end

#xml = XmlDocument.new(true)
#print xml.hello{"world!"}
#print "\n"
#print xml.hello{xml.goodbye{"world!"}}
#print "\n"
#print xml.hello{xml.goodbye{xml.come_back{xml.ok_fine(:be=>"that_way")}}}
