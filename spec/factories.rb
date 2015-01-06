FactoryGirl.define do

  factory :printing_type do
    title "PrintBook"
    photo "/img/printbook.jpg"
  end

  factory :format do
    title '30x20'
    photo '/img/30x20.jpg'
  end

  factory :edition do
    min_pages 16
    max_pages 20
    step 2
    min_edition 1
    max_edition 4
  end

  factory :edition_option do
    paper_option 'с ламенированием'
    price 107
    difference 8
  end

  

end