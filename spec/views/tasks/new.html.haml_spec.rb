require "spec_helper"

describe "tasks/new.html.haml" do
  let(:task) {
    mock('Task')
  }

  before(:each) { assign(:task, task) }

  subject { render }

  xit { should render_partial('tasks/form') }
end
