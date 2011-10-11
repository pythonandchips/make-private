require "spec_helper"

describe MakePrivate do
  it "should add the make private method to active record class" do
    Foo.should respond_to :make_private
  end


end
