User.create!(name: "Diem Ly Vu",
  email: "diemly.admin@example.com",
  password: "111111",
  password_confirmation: "111111",
  admin: true)

User.create!(name: "Example User", email: "example@railstutorial.org",
  password: "foobar", password_confirmation: "foobar", admin: true)

49.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name: name, email: email, password: password,
    password_confirmation: password)
end

Category.create!(name: "Art")
Category.create!(name: "Children's")
Category.create!(name: "Classics")
Category.create!(name: "Fantasy")
Category.create!(name: "Romance")

Book.create!(author: "J.K. Rowling",
  description: "Harry Potter's life is miserable.
  His parents are dead and he's stuck with his heartless relatives,
  who force him to live in a tiny closet under the stairs.
  But his fortune changes when he receives a letter that tells him the truth
  about himself: he's a wizard. A mysterious visitor rescues him from his relatives
  and takes him to his new home, Hogwarts School of Witchcraft and Wizardry.",
  title: "Harry Potter and the Sorcerer's Stone", image: nil,
  publish_date:"1997-06-26", number_of_pages: 320, category_id: 2)

Book.create!(author: "J.K. Rowling",
  description: "Harry Potter is lucky to reach the age of thirteen,
  since he has already survived the murderous attacks of the feared Dark Lord on
  more than one occasion. But his hopes for a quiet term concentrating on Quidditch
  are dashed when a maniacal mass-murderer escapes from Azkaban, pursued by the soul-sucking
  Dementors who guard the prison. It's assumed that Hogwarts is the safest place for
  Harry to be. But is it a coincidence that he can feel eyes watching him in the dark,
  and should he be taking Professor Trelawney's ghoulish predictions seriously?",
  title: "Harry Potter and the Prisoner of Azkaban", image: nil,
  publish_date:"1997-06-26", number_of_pages: 320, category_id: 2)

Book.create!(author: "J.K. Rowling",
  description: "The Dursleys were so mean and hideous that summer that all
  Harry Potter wanted was to get back to the Hogwarts School
  for Witchcraft and Wizardry. But just as he's packing his bags,
  Harry receives a warning from a strange,
  impish creature named Dobby who says that if Harry Potter returns to Hogwarts,
  disaster will strike.",
  title: "Harry Potter and the Chamber of Secrets", image: nil,
  publish_date:"1997-06-26", number_of_pages: 320, category_id: 2)

Book.create!(author: "John Green",
  description: "Despite the tumor-shrinking medical miracle that has bought her a
  few years, Hazel has never been anything but terminal, her final chapter
  inscribed upon diagnosis. But when a gorgeous plot twist named Augustus Waters
  suddenly appears at Cancer Kid Support Group, Hazel's story is about to be completely
  rewritten.",
  title: "The Fault in Our Stars", image: nil,
  publish_date:"2007-06-26", number_of_pages: 250, category_id: 5)

Book.create!(author: "Gabriel Garcia Márquez",
  description: "Cho đến nay Trăm Năm Cô Đơn vẫn là cuốn tiểu thuyết lớn nhất của
  Gabriel Garcia Márquez, nhà văn Columbia, người được giải Nobel về văn học năm 1982.
  Trăm Năm Cô Đơn ra đời (1967) đã gây dư luận sôi nổi trên văn đàn Mỹ Latinh và
  lập tức được cả thế giới hâm mộ. Sau gần hai mươi năm, Trăm Năm Cô Đơn đã có mặt
  ở khắp nơi trên hành tinh chúng ta để đến với mọi người và mọi nhà.",
  title: "Trăm năm cô đơn", image: nil,
  publish_date:"2010-05-03", number_of_pages: 425, category_id: 3)
