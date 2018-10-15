require_relative "../../spec_helper"
require_relative "../../../player"

describe Player do
  describe "column casting" do
    before do
      DB.instance.connection.exec("INSERT INTO players (id, first_name, last_name, position, birthdate) VALUES(1, 'Sarah', 'Onion', 'center', '1984/5/11')")
    end

    let(:player) { described_class.find(id: 1) }

    it "casts the id to an integer" do
      expect(player.attributes["id"]).to eq 1
    end

    it "casts the birthdate to an date object" do
      expect(player.attributes["birthdate"]).to eq Date.new(1984, 5, 11)
    end

    it "leaves string columns as strings" do
      expect(player.attributes["first_name"]).to eq "Sarah"
    end
  end
end
