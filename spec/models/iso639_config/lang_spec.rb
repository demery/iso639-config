require 'spec_helper'

module Iso639Config
  describe Lang do
    def valid_attributes
      @valid_attributes ||= {
        bib_code: "ara"
      }
    end

    # ------------------------------------------------------------
    # initialization
    # ------------------------------------------------------------
    context "(initialization)" do
      it "is valid" do
        Lang.new(valid_attributes).should be_valid
      end

      it "creates a Lang" do
        Lang.create!(valid_attributes).should be_a(Lang)
      end

      it "has a factory" do
        Factory.build(:lang).should be_a(Lang)
      end
    end # context "(initialization)"

    # ------------------------------------------------------------
    # attributes
    # ------------------------------------------------------------
    context "(attributes)" do
      it "has a bib_code" do
        Lang.new(:bib_code => (bib_code = "ara")).bib_code.should eq(bib_code)
      end

      it "has a display" do
        Lang.new(display: (display = true)).display.should eq(display)
      end

      it "has a script_direction" do
        Lang.new(script_direction: (script_direction = "rtl")).script_direction.should eq(script_direction)
      end

    end # context "(attributes)"

    # ------------------------------------------------------------
    # validations
    # ------------------------------------------------------------
    context "(validations)" do
      it "requires a bib_code" do
        Lang.new.should have(1).error_on(:bib_code)
      end

      it "requires a bib_code be unique" do
        Lang.create!(valid_attributes)
        Lang.new(valid_attributes).should have(1).error_on(:bib_code)
      end

    end # context "(validations)"

    # ------------------------------------------------------------
    # methods
    # ------------------------------------------------------------
    context "(methods)" do
    end # context "(methods)"
  end
end
