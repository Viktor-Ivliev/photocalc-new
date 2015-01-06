require 'spec_helper'

describe PrintingType do

  before(:each) do
    @print_book = FactoryGirl.build(:printing_type)
    format = FactoryGirl.build(:format)
    edition = FactoryGirl.build(:edition)
    edition_option = FactoryGirl.build(:edition_option)

    edition.edition_options << edition_option
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
          data: [16, 18, 20],
          edition_option:[
            {
              paper_option: 'с ламенированием',
              price: 107,
              difference: 8
            }
          ]
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
          data: [16, 18, 20],
          edition_option:[
            {
              paper_option: 'с ламенированием',
              price: 107,
              difference: 8
            }
          ]
        },
        {
          caption: 'Price from 5 to 99',
          data: [16, 18, 20],
          edition_option:[]
        }
      ]
    }
    expect(format.to_data).to eq(output)
  end


  it "show correct output with one edition and edition option" do
    #наполняем нужным образом данные
    print_book = PrintingType.where(title: "PrintBook").last
    format = print_book.formats.first

    # делаем заготовку того что хотим получить
    output = {
      title: '30x20',
      photo: '/img/30x20.jpg',
      editions: [
        {
          caption: 'Price from 1 to 4',
          data: [16, 18, 20],
          edition_option:[
            {
              paper_option: 'с ламенированием',
              price: 107,
              difference: 8
            }
          ]
        }
      ]
      
    }
    expect(format.to_data).to eq(output)
  end


  it "show correct output with two edition and one options" do
    print_book = PrintingType.where(title: "PrintBook").last
    format = print_book.formats.first

    edition = FactoryGirl.build(:edition, min_edition: 5, max_edition: 99)
    edition_option = FactoryGirl.build(:edition_option, paper_option: 'без ломинирования', price: 99, difference:8)
    edition.edition_options << edition_option
    format.editions << edition
    format.save
    output = {
      title: '30x20',
      photo: '/img/30x20.jpg',
      editions: [
        {
          caption: 'Price from 1 to 4',
          data: [16, 18, 20],
          edition_option:[
            {
              paper_option: 'с ламенированием',
              price: 107,
              difference: 8
            }
          ]
        },
        {
          caption: 'Price from 5 to 99',
          data: [16, 18, 20],
          edition_option:[
            {
              paper_option: 'без ломинирования',
              price: 99,
              difference: 8
            }]
        }
      ]
    }
    expect(format.to_data).to eq(output)
  end


  it "show correct output with two edition and two options" do
    print_book = PrintingType.where(title: "PrintBook").first
     edition_option = FactoryGirl.build(:edition_option, paper_option: 'без ломинирования', price: 99, difference:8)

    format = print_book.formats.first
    edition = format.editions.first
    edition.edition_options << edition_option
    format.editions << edition
    format.save

    format = print_book.formats.first
    edition = FactoryGirl.build(:edition, min_edition: 5, max_edition: 99)
    edition.edition_options << edition_option
    format.editions << edition
    format.save


    output = {
      title: '30x20',
      photo: '/img/30x20.jpg',
      editions: [
        {
          caption: 'Price from 1 to 4',
          data: [16, 18, 20],
          edition_option:[
            {
              
              paper_option: 'без ломинирования',
              price: 99,
              difference: 8
            }
          ],
          edition_option:[
            {
              paper_option: 'с ламенированием',
              price: 107,
              difference: 8
            }
          ]
        },
        {
          caption: 'Price from 5 to 99',
          data: [16, 18, 20],
          edition_option:[
            {
              paper_option: 'без ломинирования',
              price: 99,
              difference: 8
            }
          ]
        }
      ]
    }
    expect(format.to_data).to eq(output)
  end   




end