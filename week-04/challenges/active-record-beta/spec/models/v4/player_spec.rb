require_relative "../../spec_helper"
require_relative "../../../player"

describe Player do
  describe "setter methods" do
    let(:player) do
      described_class.new(attributes: {"id" => 1,
                                       "first_name" => "Sarah",
                                       "last_name" => "Onion",
                                       "birthdate" => "1985/05/11",
                                       "team_id" => nil})
    end

    it "sets id" do
      player.id = 2
      expect(player.id).to eq 2
    end

    it "sets birthdate" do
      player.birthdate = Date.new(1980, 2, 15)
      expect(player.birthdate).to eq Date.new(1980, 2, 15)
    end

    it "sets first_name" do
      player.first_name = "Mark"
      expect(player.first_name).to eq "Mark"
    end

    it "sets last_name" do
      player.last_name = "Rogers"
      expect(player.last_name).to eq "Rogers"
    end

    it "sets team_id" do
      player.team_id = 4
      expect(player.team_id).to eq 4
    end

    it "does not respond to setters that are not columns" do
      expect{ player.not_a_column = "abc"}.to raise_error NoMethodError
    end
  end
end
