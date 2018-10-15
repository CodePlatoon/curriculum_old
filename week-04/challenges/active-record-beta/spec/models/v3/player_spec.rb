require_relative "../../spec_helper"
require_relative "../../../player"

describe Player do
  describe "getter methods" do
    before do
      DB.instance.connection.exec("INSERT INTO players (id, first_name, last_name, position, birthdate) VALUES(1, 'Sarah', 'Onion', 'center', '1984/5/11')")
    end

    let(:player) { described_class.find(id: 1) }

    it "responds to .id" do
      expect(player.id).to eq 1
    end

    it "responds to .birthdate" do
      expect(player.birthdate).to eq Date.new(1984, 5, 11)
    end

    it "responds to .first_name" do
      expect(player.first_name).to eq "Sarah"
    end

    it "responds to .last_name" do
      expect(player.last_name).to eq "Onion"
    end

    it "responds to .team_id" do
      expect(player.team_id).to be_nil
    end

    it "does not respond to methods that are not columns" do
      expect{ player.not_a_column }.to raise_error NoMethodError
    end
  end
end
