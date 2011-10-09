module PhoneNumber
  class PhoneNumber
    attr_accessor :number, :locale

    def initialize(*params)
      self.number = params.first
      @locale = I18n.locale if defined?(I18n) && I18n.respond_to?(:locale)
      if params[1].respond_to?(:each)
        params[1].each {|k,v| send("#{k}=",v) if respond_to?("#{k}=") }
      end
      self
    end

    def locale=(l)
      @locale = l.to_sym
    end

    def number=(n)
      @number=n.to_s
    end

    def number_stripped
      @number.gsub(/[^0-9x]+/i,'')
    end

    def matchers
      m = matchers_from_i18n
      return m if m.size > 0
      [{:format=>"\\1-\\2", :h264=>nil, :match=>/^(\d{3})(\d{4})$/, :description=>"7 digits"}, 
       {:format=>"(\\1) \\2-\\3", :h264=>"+1\\1\\2\\3", :match=>/^1?(\d{3})(\d{3})(\d{4})$/, :description=>"10 digits"},
       {:format=>"(\\1) \\2-\\3 x\\4", :h264=>"+1\\1\\2\\3", :match=>/^1?(\d{3})(\d{3})(\d{4})x([\d]+)$/i, :description=>"10 digits plus extension"}
       ] 
    end

    def to_s(format=nil)
      matchers.each do |matcher|
        replace = (format ? matcher[format] : matcher[:format])
        return number_stripped.gsub(matcher[:match], replace) if number_stripped =~ matcher[:match]
      end
      @number
    end

    private
    def matchers_from_i18n
      return [] unless defined?(I18n)
      original_locale = I18n.locale
      I18n.locale = @locale
      formats = I18n.t "phone_number.formats"
      I18n.locale = original_locale
      return_val = if formats.is_a?(Array)
        formats.collect{|i| i.symbolize_keys}
      elsif formats.is_a?(Hash)
        [formats.symbolize_keys]
      else
        []
      end
    end
  end
end
