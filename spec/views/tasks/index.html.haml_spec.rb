require "spec_helper"

describe "tasks/index.html.haml" do

  before(:each) { assign(:tasks, []) }

  subject { render }

  it { should have_xpath('//h1', :content => 'Tasks') }

  it { should have_xpath('//ul[@class="tasks"]/li[@class="new"]/form',
                         :method => 'post',
                         :action => tasks_path) }

  context "given 2 tasks" do
    before(:each) do
      assign(:tasks, [
        stub_model(Task, :title => "test 1", :priority => 2),
        stub_model(Task, :title => "test 2", :priority => 3)
      ])
    end

    subject { render }

    it { should have_xpath('//ul[@class="tasks"]/li[@class="priority-2"]', :content => 'test 1') }
    it { should have_xpath('//ul[@class="tasks"]/li[@class="priority-3"]', :content => 'test 2') }
  end
end
