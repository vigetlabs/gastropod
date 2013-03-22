module Gastropod
  module ActiveRecord
    module Validations
      def self.included(base)
        base.validates :slug, :uniqueness => true
        base.validates :slug, :format     => { :with => /^[a-z0-9-]+$/, :allow_blank => true }
        base.validates :slug, :presence   => true

        base.before_validation :assign_generated_slug, :if => :generate_slug?
      end
    end
  end
end
