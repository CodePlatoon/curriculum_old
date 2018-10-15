require_relative "../../spec_helper"
require_relative "../../../team"

describe Team do
  describe "getter methods" do
    before do
      DB.instance.connection.exec("INSERT INTO teams (id, name) VALUES(1, 'Falcons')")
    end

    let(:team) { described_class.find(id: 1) }

    it "responds to .id" do
      expect(team.id).to eq 1
    end

    it "responds to .name" do
      expect(team.name).to eq "Falcons"
    end

    it "does not respond to methods that are not columns" do
      expect{ team.not_a_column }.to raise_error NoMethodError
    end
  end
end
