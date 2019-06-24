class Array
  def rebuild!
    self.map! do |value|
      if value.class == Array
        value.map! do |i|
          yield(i, value.count)
        end
      else
        yield(value, self.count)
      end
    end if block_given?
  end
end
