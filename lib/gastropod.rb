require "gastropod/active_record/validations" if Object.const_defined? "ActiveRecord"

module Gastropod
  def self.extended(base)
    base.send(:instance_variable_set, "@slug_source_attribute", "name")
    base.send(:include, InstanceMethods)
  end

  def slug(attribute)
    instance_variable_set("@slug_source_attribute", attribute)
  end

  def slug_source_attribute
    @slug_source_attribute
  end

  def slug_finder
    instance_variable_defined?("@slug_finder") ? @slug_finder : default_slug_finder
  end

  def default_slug_finder
    lambda {|value| where(:slug => value) }
  end

  module InstanceMethods

    def assign_generated_slug
      self.slug = next_available_slug if generate_slug?
    end

    private

    def slug_source
      send self.class.slug_source_attribute
    end

    def slug_from_source
      slug_source.to_s.downcase.gsub(/[^a-zA-Z0-9\-_]+/, '-')
    end

    def generate_slug?
      slug_source.present? && slug.blank?
    end

    def next_available_slug
      possible_slug = slug_from_source

      index = 2
      while self.class.slug_finder.call(possible_slug).any?
        possible_slug = slug_from_source + "-#{index}"
        index+= 1
      end
      possible_slug
    end
  end
end
