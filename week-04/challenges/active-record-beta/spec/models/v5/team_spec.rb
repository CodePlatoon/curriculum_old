require_relative "../../spec_helper"
require_relative "../../../team"

describe Team do
  describe "saving a new record" do
    let(:team) do
      described_class.new(attributes: {"name" => "Falcons"})
    end

    it "sets the id after saving" do
      # Team.generate_prepared_statements
      team.save
      expect(team.id.class).to eq Fixnum
    end

    it "inserts a new record in the database" do
      team.save
      expect(Team.find(id: team.id).name).to eq "Falcons"
    end
  end

  describe "updating a record" do
    before do
      DB.instance.connection.exec("INSERT INTO teams (id, name) VALUES(1, 'Falcons') RETURNING *")
    end

    let(:team) { described_class.find(id: 1) }

    it "updates the name" do
      team.name = "Hawks"
      team.save

      expect(Team.find(id: team.id).name).to eq "Hawks"
    end
  end
end
