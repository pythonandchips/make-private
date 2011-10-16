require "spec_helper"

describe MakePrivate do
  context "a class that inherit ActiveRecord::Base" do
    Given(:foo){Foo}
    Then{foo.should respond_to :make_private}
  end

  context "a class that has a belongs to association" do
    Given(:foo){Foo.new}
    Then do
      lambda {
        foo.bar
      }.should raise_error(NoMethodError)
    end
  end
  context "a class that has a has one association" do
    Given(:foo){Foo.new}
    Then do
      lambda {
        foo.qux
      }.should raise_error(NoMethodError)
    end
  end
  context "a class that has a has many association" do
    Given(:foo){Foo.new}
    Then do
      lambda {
        foo.quux
      }.should raise_error(NoMethodError)
    end
  end
  context "a class that has a has and belongs to may association" do
    Given(:foo){Foo.new}
    Then do
      lambda {
        foo.corge
      }.should raise_error(NoMethodError)
    end
  end

  context "with properties" do
    Then do
      lambda {
        foo = Foo.new
        foo.a_prop = "blah"
      }.should raise_error(NoMethodError)
    end

    context "when setting property from public method" do
      Given(:value){"hello"}
      When(:foo) do
        foo = Foo.new
        foo.set_property(value)
        foo
      end
      Then{foo.get_property.should eql value}
    end
  end

  context "should not affect other classes properties in project" do
    Given(:qux){Qux.new}
    Then do
      lambda {
        qux.a_prop = "hello"
      }.should_not raise_error(NoMethodError)
    end
  end

end
