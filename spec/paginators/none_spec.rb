require "spec_helper"

describe IrwiMod::Paginators::None do

  before(:each) do
    @p = IrwiMod::Paginators::None.new
  end

  specify "should paginate collection - call find" do
    coll = mock "Collection"
    coll.should_receive(:find).with(:all,{}).and_return("full collection")

    @p.paginate( coll, :page => 10 ).should == "full collection"
  end

  specify "should render paginated section" do
    a = nil
    @p.paginated_section "view", "collection" do
      a = true
    end
    a.should be_true
  end

end
