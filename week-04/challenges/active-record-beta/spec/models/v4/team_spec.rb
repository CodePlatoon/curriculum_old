require_relative "../../spec_helper"
require_relative "../../../team"

describe Team do
  describe "setter methods" do
    let(:team) do
      described_class.new(attributes: {"id" => 1,
                                       "name" => "Falcons"})
    end

    it "sets id" do
      team.id = 2
      expect(team.id).to eq 2
    end

    it "sets name" do
      team.name = "Hawks"
      expect(team.name).to eq "Hawks"
    end

    it "does not respond to setters that are not columns" do
      expect{ team.not_a_column = "abc"}.to raise_error NoMethodError
    end
  end
end
