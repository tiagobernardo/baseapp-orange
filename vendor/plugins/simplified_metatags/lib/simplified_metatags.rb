module SimplifiedMetatags

  class ActionController::Base

    protected

    ##
    #
    #
    def add_meta_description(content)
      @meta_description = meta('description', content)
    end

    ##
    #
    #
    def self.add_meta_description(content, options = {})
      before_filter options do |controller|
        controller.send(:add_meta_description, content)
      end
    end

    ##
    #
    #
    def add_meta_keywords(content)
      @meta_keywords = meta('keywords', content)
    end

    def self.add_meta_keywords(content, options = {})
      before_filter options do |controller|
        controller.send(:add_meta_keywords, content)
      end
    end
    
    ##
    #
    #
    def add_title(content)
      @site_title = title(content)
    end

    def self.add_title(content, options = {})
      before_filter options do |controller|
        controller.send(:add_title, content)
      end
    end
    ##
    #
    #
    def meta(name, content)
      %(<meta name="#{name}" content="#{content}" />)
    end

    def title(content)
      %(<title>#{content} - #{configatron.site_name}</title>)
    end
  end

  module Helper

    def metatags
      @metatags = []
      @metatags << @meta_description
      @metatags << @meta_keywords
      @metatags << @site_title
      return @metatags.join("\n") rescue nil
    end

  end

end

ActionController::Base.send(:include, SimplifiedMetatags)
ActionView::Base.send(:include, SimplifiedMetatags::Helper)