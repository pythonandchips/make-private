require "make_private/version"
require "make_private/active_record_persistence"

module MakePrivate
  def self.included(klass)
    klass.class_eval do
      self.columns.each do |column|
        self.instance_eval do
          define_method(:"#{column.name}=") do |val|
            write_attribute column.name.to_sym, val
          end

          define_method(:"#{column.name}") do
            self[column.name.to_sym]
          end
          private :"#{column.name}=", column.name.to_sym
        end
      end

      class << self
        alias :__belongs_to_public :belongs_to
        alias :__has_one_public :has_one
        alias :__has_many_public :has_many
        alias :__has_and_belongs_to_many_public :has_and_belongs_to_many

        def belongs_to *args, &block
          __belongs_to_public *args, &block
          private args[0], :"#{args[0]}="
        end

        def has_one *args, &block
          __has_one_public *args, &block
          private args[0], :"#{args[0]}="
        end

        def has_many *args, &block
          __has_many_public *args, &block
          private args[0], :"#{args[0]}="
        end

        def has_and_belongs_to_many *args, &block
          __has_and_belongs_to_many_public *args, &block
          private args[0], :"#{args[0]}="
        end
      end
    end
  end
end
