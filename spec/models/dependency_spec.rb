require 'spec_helper'

describe Dependency do
  # object
  it { should have_db_column(:object_id).of_type(:integer) }
  it { should belong_to(:object) }

  # subject
  it { should have_db_column(:subject_id).of_type(:integer) }
  it { should belong_to(:subject) }




end
