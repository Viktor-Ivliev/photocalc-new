require 'spec_helper'

describe PrintingType do

  before(:each) do
    @print_book = FactoryGirl.build(:printing_type)
    format = FactoryGirl.build(:format)
    edition = FactoryGirl.build(:edition)

    format.editions << edition
    @print_book.formats << format
    @print_book.save!
  end

  it "exists on db level" do
    expect(@print_book.formats.count).to eq(1)
  end

  it "show correct output with one edition" do
    print_book = PrintingType.where(title: "PrintBook").last
    format = print_book.formats.first
    output = {
      title: '30x20',
      photo: '/img/30x20.jpg',
      editions: [
        {
          caption: 'Price from 1 to 4',
          data: [16, 18, 20]
        }
      ]
    }
    expect(format.to_data).to eq(output)
  end

  it "show correct output with two edition" do
    edition = FactoryGirl.build(:edition, min_edition: 5, max_edition: 99)
    print_book = PrintingType.where(title: "PrintBook").last
    format = print_book.formats.first
    format.editions << edition
    format.save
    output = {
      title: '30x20',
      photo: '/img/30x20.jpg',
      editions: [
        {
          caption: 'Price from 1 to 4',
          data: [16, 18, 20]
        },
        {
          caption: 'Price from 5 to 99',
          data: [16, 18, 20]
        }
      ]
    }
    expect(format.to_data).to eq(output)
  end

end