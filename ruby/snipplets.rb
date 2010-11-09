my_instance = mock(object)o
my_instance.stub!(:msg).and_return(value)

MyClass.stub!(:msg).and_return(value)

A.stub!(:msg).and_return(:default_value)
A.should_receive(:msg).with(:arg).and_return(:special_value)

A.msg
A.msg(:any_other_arg)
A.msg(:arg)
A.msg(:any_other_other_arg)

A.msg
