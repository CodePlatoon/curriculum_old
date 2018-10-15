require_relative "../../spec_helper"
require_relative "../../../team"

describe Team do
  describe "column casting" do
    before do
      DB.instance.connection.exec("INSERT INTO teams (id, name) VALUES(1, 'Falcons')")
    end

    let(:team) { described_class.find(id: 1) }

    it "casts the id to an integer" do
      expect(team.attributes["id"]).to eq 1
    end

    it "leaves string columns as strings" do
      expect(team.attributes["name"]).to eq "Falcons"
    end
  end
end
