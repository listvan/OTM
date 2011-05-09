require "spec_helper"

describe TasksController do
  describe "routing" do
    it "recognizes /tasks" do
      { :get => "tasks" }.should route_to(:controller => "tasks", :action => "index")
    end

    it "generates /tasks" do
      tasks_path().should == "/tasks"
    end

    it "recognizes /tasks/1" do
      { :get => "tasks/1" }.should route_to(:controller => "tasks", :action => "show", :id => "1")
    end

    it "generates /tasks/1" do
      task_path(1).should == "/tasks/1"
    end
  end
end
