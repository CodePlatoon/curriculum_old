require_relative "../../spec_helper"
require_relative "../../../player"

describe Player do
  describe ".table_name" do
    it "should return players" do
      expect(described_class.table_name).to eq "players"
    end
  end

  describe ".find" do
    before do
      DB.instance.connection.exec("INSERT INTO players (id, first_name, last_name, position) VALUES(1, 'Sarah', 'Onion', 'center')")
    end

    let(:player) { described_class.find(id: 1) }

    it "returns a Player instance" do
      expect(player.class).to eq Player
    end

    it "returns the player row with matching id" do
      expect(player.attributes["first_name"]).to eq "Sarah"
    end
  end
end
