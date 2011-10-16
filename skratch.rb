class DoSomething

  def call_method
    self.hello = "world"
  end

  private

  def hello= val
    puts "equal method called #{val}"
  end
end

do_something = DoSomething.new
do_something.call_method
