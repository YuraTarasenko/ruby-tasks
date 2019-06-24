module Truncate
  def truncate(*attrs, length: 120)
    attrs.each do |attr|
      define_method("#{attr}=") do |string|
       	string = string.length > length ? "#{string[0...length]}#{'...'}" : string
      	instance_variable_set("@#{attr}", string)
      end

      define_method(attr) {	instance_variable_get("@#{attr}") }
    end
  end
end

