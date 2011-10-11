class Foo < ActiveRecord::Base
  make_private

  belongs_to :bar
  has_one :qux
  has_many :quux
  has_and_belongs_to_many :corge

end
