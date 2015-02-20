require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the UsermailerHelper. For example:
#
describe UsermailerHelper do
  describe "string concat" do
    xit "concats two strings with spaces" do
      expect(helper.concat_strings("this","that")).to eq("this that")
    end
  end
end
RSpec.describe UsermailerHelper, type: :helper do
  pending "add some examples to (or delete) #{__FILE__}"
end
