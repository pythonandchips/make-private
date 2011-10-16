# make-private


make-private is an ActiveRecord extension that will make all your active record properties private and give you control over what is private and what should be public.

# Why make-private

By default active record makes all properties and associations public which does make it faster to develop with but breaks encapsulation by default. make-private has been developed to bring back encapsulation to active record model.


## Status
_make-private_ is currently in development

## Example

To use make-private private you simply have to include the module in your model, simple.

<pre>
require 'make-private'

class BusinessModel < ActiveRecord::Base
  \#a_property: string
  include MakePrivate

end

business_model = BusinessModel.new
business_model.a_property \# This will throw a NoMethodError exception
</pre>

Properties can be set as normal from within the model
<pre>
require 'make-private'

class BusinessModel < ActiveRecord::Base
  \#a_property: string
  include MakePrivate

  def do_something_useful parameter
    ##some logic
    self.a_property = parameter
  end

end

</pre>

If you require to make a property publicaly readable set the method to public
<pre>
require 'make-private'

class BusinessModel < ActiveRecord::Base
  #a_property: string
  include MakePrivate

  public :a_property
end

business_model = BusinessModel.new
business_model.a_property # This will no longer throw a NoMethodError exception
business_model.a_property = "something interesting" # This will still throw a NoMethodError exception
</pre>

Similarly if you really really really need to make the property setter public.
<pre>
require 'make-private'

class BusinessModel < ActiveRecord::Base
  #a_property: string
  include MakePrivate

  public :a_property, :a_property=
end

business_model = BusinessModel.new
business_model.a_property # This will no longer throw a NoMethodError exception
business_model.a_property = "something interesting" # This will not throw a NoMethodError exception
</pre>

##Notes

Please send any questions, comments or feedback to pythonandchips{at}gmail.com.

Cheers
Colin
