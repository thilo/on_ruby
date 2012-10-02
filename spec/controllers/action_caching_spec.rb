require 'spec_helper'

# TODO (ps) move this to it's own spec group

describe HomeController do

  before { set_subdomain }

  describe "caching condition" do
    it "should not cache for mobile requests" do
      get :index, format: :mobile
      controller.class.caches_action_condition(controller).should be_false
    end

    it "should cache for other formats" do
      get :index
      controller.class.caches_action_condition(controller).should be_true
    end
  end

  describe "cache path" do
    let(:date) { Date.today }
    let(:options) { {"controller"=>"home", "action"=>"index", "locale"=>:de, "date"=>date} }

    it "should generate a valid cache path options" do
      Timecop.freeze date do
        get :index
        controller.class.caches_action_cache_path(controller).should eql(options)
      end
    end
  end
end
