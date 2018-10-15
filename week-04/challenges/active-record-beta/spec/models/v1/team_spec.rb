require_relative "../../spec_helper"

require_relative "../../../db"
require_relative "../../../team"

describe Team do
  describe ".table_name" do
    it "should return teams" do
      expect(described_class.table_name).to eq "teams"
    end
  end

  describe ".find" do
    before do
      DB.instance.connection.exec("INSERT INTO teams (id, name) VALUES(1, 'Falcons')")
    end

    let(:team) { described_class.find(id: 1) }

    it "returns a Team instance" do
      expect(team.class).to eq Team
    end

    it "returns the team row with matching id" do
      expect(team.attributes["id"]).to eq "1"
    end
  end
end
