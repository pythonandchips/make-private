class Foo < ActiveRecord::Base
  make_private

  belongs_to :bar
  has_one :qux
  has_many :quux
  has_and_belongs_to_many :corge

  def set_property value
    self.a_prop = value
  end

  def get_property
    a_prop
  end
end
