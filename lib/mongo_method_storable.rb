require "mongo_method_storable/version"
# require "mongoid/attributes"

module MongoMethodStorable
  MONGO_STORE_PREFIX = '_old_mstore_'

  def mongo_store(method_name)
    old_method_name = "#{MONGO_STORE_PREFIX + method_name.to_s}".to_sym
    raise AlreadyAliasedError.new("Already aliased #{method_name}") if method_defined?(old_method_name)
    alias_method old_method_name, method_name

    if instance_method(method_name).arity == 0
      define_method method_name do
        attr_val = read_attribute method_name
        return attr_val if attr_val
        attr_val = send old_method_name
        write_attribute(method_name, attr_val)
        save!
        attr_val
      end
    else
      # deal with this case when I need to
    end
  end

  def storable_methods
    self.instance_methods.
      select {|m| self.instance_method(m).name.to_s.start_with? MONGO_STORE_PREFIX}.
      map {|m| m.slice(MONGO_STORE_PREFIX.length..m.length).to_sym}
  end

  class AlreadyAliasedError < RuntimeError; end
end
