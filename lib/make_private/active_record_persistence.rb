require "active_record/persistence"
module ActiveRecord
  module Persistence

    private

    def create
      attributes_values = arel_attributes_values(!id.nil?)

      new_id = self.class.unscoped.insert attributes_values
      if self.class.primary_key
        id ||= new_id
        self.send(:id=, id)
      end

      IdentityMap.add(self) if IdentityMap.enabled?
      @new_record = false
      id
    end
  end
end
