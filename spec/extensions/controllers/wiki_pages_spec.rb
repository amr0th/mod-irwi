require "spec_helper"

require "action_controller"

require "protected_attributes"

describe IrwiMod::Extensions::Controllers::WikiPages do

  class WikiPage; end
  class WikiPagesController < ActionController::Base
    include IrwiMod::Extensions::Controllers::WikiPages

    private

    def main_current_user
      return @main_current_user if defined?(@main_current_user)
      @main_current_user = 'Some user'
    end

  end

  it { should_not be_nil }

  before(:all) do
    @cls = WikiPagesController
  end

  context "class" do

    it { @cls.should respond_to(:set_page_class) }
    it { @cls.should respond_to(:page_class) }

    specify "should have WikiPage as default page_class" do
      @cls.page_class.should == WikiPage
    end

  end

  context "instance" do

    before(:each) do
      @obj = @cls.new
    end

    it { @obj.should respond_to(:page_class) }

    specify "should have WikiPage as default page_class" do
      @obj.send(:page_class).should == WikiPage
    end

    it { @obj.should respond_to(:render_template) }
    it { @obj.should respond_to(:setup_main_current_user) }
    it { @obj.should respond_to(:setup_page) }

    it { @obj.should respond_to(:show) }
    it { @obj.should respond_to(:new) }
    it { @obj.should respond_to(:edit) }
    it { @obj.should respond_to(:update) }
    it { @obj.should respond_to(:history) }
    it { @obj.should respond_to(:compare) }
    it { @obj.should respond_to(:destroy) }

    specify "should correctly handle main_current_user" do
      @obj.send(:setup_main_current_user)
      @obj.send(:main_current_user).should == 'Some user'
      @obj.instance_variable_get(:@main_current_user).should == 'Some user'
    end

  end

end
