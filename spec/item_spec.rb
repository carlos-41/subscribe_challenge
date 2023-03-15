require 'item'

RSpec.describe Item do
  describe ("new item") do
    it "when is created" do
      item = described_class.new(2, 10.5, "Book", "Harry Potter")

      expect(item).not_to be_nil
    end

    it "when is not imported" do
      item = described_class.new(2, 10.5, "Book", "book")

      expect(item.imported?).to be_falsey
    end

    it "when is exempt and imported" do
      item = described_class.new(2, 10.5, "Book", "imported book")
      expect(item.imported?).to be_truthy
      expect(item.subtotal).to eq(21)
      expect(item.taxes).to eq(1.05)
      expect(item.total).to eq(22.05)
    end

    it "when is not exempt and imported" do
      item = described_class.new(1, 34.99, "Electronics", "Airpods")
      expect(item.subtotal).to eq(34.99)
      expect(item.taxes).to eq(3.5)
      expect(item.total).to eq(38.49)
    end
  end
end