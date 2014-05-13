module Compass::SassExtensions::Functions::Lists
  def first_value_of(list)
    if list.is_a?(Sass::Script::String)
      Sass::Script::String.new(list.value.split(/\s+/).first)
    else
      list
    end
  end

  # Returns a new list after removing any non-true values
  def compact(*args)
    sep = :comma
    if args.size == 1 && args.first.is_a?(Sass::Script::List)
      list = args.first
      args = list.value
      sep = list.separator
    end
    Sass::Script::List.new(args.reject{|a| !a.to_bool}, sep)
  end
end
