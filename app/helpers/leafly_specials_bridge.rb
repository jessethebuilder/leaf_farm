module LeaflySpecialsBridge
  def self.included(klass)
    klass.class_eval do
      extend LeaflySpecialsBridgeClassMethods
    end
  end
end

module LeaflySpecialsBridgeClassMethods
  def build_special_from_leafly(hash)
    s = Special.new
    s.name = hash['title']
    s.description = hash['description']
    s.fine_print = hash['finePrint']
    s
  end
end