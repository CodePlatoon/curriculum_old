
require_relative "../../spec_helper"
require_relative "../../../team"

describe Team do
  describe "creating new records" do
    let(:team) do
      described_class.new(attributes: {"name" => "Falcons"})
    end

    it "sets the id after saving" do
      team.save
      expect(team.id.class).to eq Fixnum
    end

    it "inserts a new record in the database" do
      team.save
      expect(Team.find(id: team.id).name).to eq "Falcons"
    end
  end
end
