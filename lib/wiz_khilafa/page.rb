require "content_store"

module WizKhilafa
  class Page
    attr_reader :options, :content_store

    def initialize(options = {})
      @options       = options
      @content_store = ContentStore.new
    end

    def view_locals
      { csrf_tag: csrf_tag }
    end

    def csrf_metatag
      self[:csrf_metatag].()
    end

    def csrf_tag
      self[:csrf_tag].()
    end

    def assets
      self[:assets]
    end

    def flash
      self[:flash]
    end

    def flash?
      %w(notice alert).any? { |type| flash[type] }
    end

    def with_flash(flash)
      with(flash: flash)
    end

    def with(new_options)
      self.class.new(options.merge(new_options))
    end

    def [](name)
      options.fetch(name)
    end
  end
end
