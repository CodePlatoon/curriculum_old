require_relative "../spec_helper"

describe SwimRecord do
  describe "validations" do
    let(:not_blank) { "can't be blank" }
    let(:not_in_list) { "is not included in the list" }
    let(:not_a_number) { "is not a number" }
    let(:swim_record) { described_class.new(attributes) }
    let(:attributes) { {} }
    let(:errors) { swim_record.errors }

    before do
      swim_record.valid?
    end

    context "first name" do
      it "validates presence" do
        expect(errors[:first_name]).to include not_blank
      end
    end

    describe "last name" do
      it "validates presence" do
        expect(errors[:last_name]).to include not_blank
      end
    end

    describe "team name" do
      it "validates presence" do
        expect(errors[:team_name]).to include not_blank
      end
    end

    describe "relay" do
      it "validates presence" do
        expect(errors[:relay]).to include not_blank
      end
    end

    describe "stroke" do
      context "invalid stroke" do
        let(:attributes) { {stroke: "doggie paddle"} }

        it "validates stoke type" do
          expect(errors[:stroke]).to include "doggie paddle is not a valid stroke"
        end
      end
    end

    describe "distance" do
      context "not a number" do
        let(:attributes) { {distance: "abc"} }

        it "validates" do
          expect(errors[:distance]).to include not_a_number
        end
      end

      context "too short" do
        let(:attributes) { {distance: 25} }

        it "requires a distance >= 50" do
          expect(errors[:distance]).to include "must be greater than or equal to 50"
        end
      end
    end

    describe "time_in_seconds" do
      context "zero" do
        let(:attributes) { {time_in_seconds: 0} }

        it "requires a value greater than zero" do
          expect(errors[:time_in_seconds]).to include "must be greater than 0"
        end
      end

      context "less than 3 decimal places" do
        # hint: regex!
        let(:attributes) { {time_in_seconds: 80.1} }

        it "requires three decimal places" do
          expect(errors[:time_in_seconds]).to include "must have 3 decimals of precision"
        end
      end
    end

    describe "record_date" do
      it "validates presence" do
        expect(errors[:record_date]).to include not_blank
      end

      context "future records" do
        let(:attributes) { {record_date: Date.today + 1.day} }

        it "does not allow records to be set in the future" do
          expect(errors[:record_date]).to include "can't be in the future"
        end
      end
    end

    describe "record_broken_date" do
      context "before record_date" do
        let(:attributes) { {record_date: Date.today,
                            record_broken_date: Date.today - 1.day} }

        it "does not allow records to be broken before the record_date" do
          expect(errors[:record_broken_date]).to include "can't be before record date"
        end
      end
    end

    describe "record_level" do
      context "invalid record_level" do
        let(:attributes) { {record_level: "city"} }

        it "validates record level" do
          expect(errors[:record_level]).to include "city is not a valid record level"
        end
      end
    end
  end
end
