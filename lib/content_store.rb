class ContentStore
  def initialize
    @content = {}
  end

  def capture(key, value = nil)
    @content[key] = block_given? ? yield : value
    nil
  end

  def [](key)
    @content[key]
  end
end
