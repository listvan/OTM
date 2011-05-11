# encoding: utf-8
require 'spec_helper'

describe Task do

  # parent
  it { should have_db_column(:parent_id).of_type(:integer) }
  it { should have_db_index(:parent_id) }
  it { should belong_to(:parent) }

  # children
  it { should have_many(:children) }

  # title
  it { should have_db_column(:title).of_type(:string) }
  it { should have_db_index(:title) }
  it { should allow_mass_assignment_of(:title) }
  it { should validate_presence_of(:title) }
  it { should ensure_length_of(:title).is_at_least(3) }
  it { should ensure_length_of(:title).is_at_most(250) }

  # description
  it { should have_db_column(:description).of_type(:text) }
  it { should allow_mass_assignment_of(:description) }
  it { should ensure_length_of(:description).is_at_most(2.kilobytes) }

  # due_at
  it { should have_db_column(:due_at).of_type(:datetime) }
  it { should allow_mass_assignment_of(:due_at) }

  # priority
  it { should have_db_column(:priority).of_type(:integer) }
  it { should have_db_index(:priority) }
  it { should validate_presence_of(:priority) }
  it { should validate_numericality_of(:priority) }

  # created_at
  it { should have_db_column(:created_at).of_type(:datetime) }

  # updated_at
  it { should have_db_column(:updated_at).of_type(:datetime) }


  it { should respond_to(:to_s) }

  context "given valid attributes" do
    subject { described_class.new(Factory.attributes_for(:task)) }

    it { should be_new_record }
    it("should be saved") do
      expect{ subject.save! }.should_not raise_error(ActiveRecord::RecordInvalid)
    end

    its(:to_s) { should == "Example Task (5)" }
  end

  context "given a long title" do
    subject { described_class.new(Factory.attributes_for(:task, :title => 'abcdefghijklmnopqrstuvwxyz')) }
    its(:to_s) { should == "abcdefghijklmnopqrs… (5)" }
  end
end
