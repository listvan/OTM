require "spec_helper"

describe TasksController do
  describe "routing" do
    it "recognizes GET /tasks" do
      { :get => "tasks" }.should route_to(:controller => "tasks", :action => "index")
    end

    it "generates /tasks" do
      tasks_path().should == "/tasks"
    end

    it "recognizes GET /tasks/1" do
      { :get => "tasks/1" }.should route_to(:controller => "tasks", :action => "show", :id => "1")
    end

    it "generates /tasks/1" do
      task_path(1).should == "/tasks/1"
    end

    it "recognizes POST /tasks" do
      { :post => "tasks" }.should route_to(:controller => "tasks", :action => "create")
    end

    it "recognizes GET /tasks/1/edit" do
      { :get => "tasks/1/edit" }.should route_to(:controller => "tasks", :action => "edit", :id => "1")
    end

    it "recognizes PUT /tasks/1" do
      { :put => "tasks/1" }.should route_to(:controller => "tasks", :action => "update", :id => "1")
    end

    it "recognizes delete /tasks/1" do
      { :delete => "tasks/1" }.should route_to(:controller => "tasks", :action => "destroy", :id => "1")
    end

    it "recognizes delete_child /tasks/1/child" do
      { :delete_child => "tasks/1/child" }.should route_to(:controller => "tasks", :action => "delete_child", :id => "1")
    end

    it "recognizes GET /tasks/1/dependencies" do
      { :get => "tasks/1/dependencies" }.should route_to(:controller => "dependencies", :action => "index", :as => :dependencies)
    end

    it "recognizes create /tasks/1/dependencies" do
      { :post => "tasks/1/dependencies" }.should route_to(:controller => "dependencies", :action => "create")
    end

    it "recognizes delete_dependency /tasks/1/dependencies/4" do
      { :delete_dependency => "tasks/1/dependencies/4" }.should route_to(:controller => "dependencies", :action => "destroy", :id => "4")
    end

    it "recognizes create /tasks/1/process" do
      { :post => "tasks/1/processes" }.should route_to(:controller => "Task::Process", :action => "create", :as => :task_processes)
    end

    it "recognizes PUT /tasks/1/processes/3" do
      { :put => "tasks/1/processes/3" }.should route_to(:controller => "Task::Process", :action => "update", :id => "3")
    end

    it "recognizes GET /" do
      { :get => "/" }.should route_to(:controller => "tasks", :action => "index")
    end









  end
end
