describe Model do
  it "Should have have records after initilize" do
    Model.should have(3).records
    Model.should have(:no).records
    Model.should have(1).records
  end

  it "Should have some errors on error record " do 
    model.should have(:no).errors_on(:attributes)
    model.should have(1).error_on(:attribute)
    model.should have(2).errors_on(:attribute)
  end
end


describe SomeController do
  integrate_views # this line is optional, with this the views generate

  # rspec recommend mock / stub object here instead use active_recore object here
  # 

  account = mock_model(Account)
  Account.should_receive(:find).with("37").and_return(account)

  # also stub as follows
  account = mock_model(Account)
  Account.stub!(:find).and_return(account)

  it "Should be like this" do
     response.should be_success
     response.should be_redirect

     get "index"
     response.should be_success
     response.should render_template("action_name")
     response.should have_text("some text")

     get "some_action"
     response.should redirect_to(:action => "")
     session["ss"].should_not be_blank

  end
end
