require "spec_helper"

describe "events/show.html.haml" do
  
  let(:user)  { Factory(:user) }
  let(:event) { Factory(:event) }

  it "should render successfully" do
    view.stubs(current_user: user, can?: false, event: event)
    render
  end

end
