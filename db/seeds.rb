# frozen_string_literal: true
require "json"
require "faker"

# ======================= [JSON DATA] ========================
  customer_data = JSON.parse(File.read("db/data/customer.json"))
  employee_data = JSON.parse(File.read("db/data/employee.json"))
  users_data = JSON.parse(File.read("db/data/users.json"))
  admin_data = JSON.parse(File.read("db/data/admin.json"))
  category_data = JSON.parse(File.read("db/data/category.json"))
  cupon_data = JSON.parse(File.read("db/data/cupon.json"))
  cupon_user_data = JSON.parse(File.read("db/data/cupon_user.json"))
  employee_category_data = JSON.parse(File.read("db/data/employee_category.json"))
  order_data = JSON.parse(File.read("db/data/order_detail.json"))
  service_data = JSON.parse(File.read("db/data/service.json"))
  review_data = JSON.parse(File.read("db/data/review.json"))  
  hability_employee_data = JSON.parse(File.read("db/data/hability_employee.json"))
  practice_data = JSON.parse(File.read("db/data/practice.json"))
  practice_employee_data = JSON.parse(File.read("db/data/practice_employee.json"))
  calendar_data = JSON.parse(File.read("db/data/calendar.json"))
  address_data = JSON.parse(File.read("db/data/address.json"))
  notification_data = JSON.parse(File.read("db/data/notification.json"))
  favorites_data = JSON.parse(File.read("db/data/favorites.json"))
  sectors_data = JSON.parse(File.read("db/data/sectors.json"))
  sector_cat_data = JSON.parse(File.read("db/data/sector_cat.json"))

# ======================= [Destroy ALL] =======================
  puts "Destroying data..."
  OrderDetail.destroy_all
  EmployeeCategory.destroy_all
  Service.destroy_all
  Customer.destroy_all
  Employee.destroy_all
  User.destroy_all
  Category.destroy_all
  Notification.destroy_all
  Favorite.destroy_all
  puts "Destroy data completed successfully!"

# ======================= [CREATE SECTOR]=======================
  puts "Seeding Favorites..."
  sectors_data.each do |sectors_data|
    sectors = Sector.new(sectors_data)
    puts sectors.errors.full_messages unless sectors.save
  end
  puts "sectors seeding end"

# ======================= [CREATE USER] =======================
  puts "Seeding User..."
  users_data.each do |user_data|
    new_user = User.new(user_data)
    puts new_user.errors.full_messages unless new_user.save
  end
  puts "User seeding end"
# ======================= [CREATE EMPLOYEE] =======================
  puts "Seeding Employees..."
  employee = Employee.new(
    full_name: "Raul Salinas",
    country: "Colombia",
    region: "Matamoros, Tamaulipas, Mexico",
    document_id: "123456",
    contact: "x123456",
    biografy: "Liliana es una mujer de 40 años de edad que destaca por su buena dispocición, diligencia, educación y celeridad constante.",
    experience: "2 años",
    user_id: 1
  )
    employee.cover.attach(io: URI.open("https://cdn-icons-png.flaticon.com/512/1432/1432472.png"), filename: "employee")
    puts employee.errors.full_messages unless employee.save

  employee = Employee.new(
    full_name: "Maria Salinas",
    country: "Colombia",
    region: "Cdmx, Roma Norte, Ciudad de México, CDMX",
    document_id: "123456",
    contact: "x123456",
    experience: "2 años",
    user_id: 3
  )
    employee.cover.attach(io: URI.open("https://cdn-icons-png.flaticon.com/512/1432/1432472.png"), filename: "employee")
    puts employee.errors.full_messages unless employee.save
  employee = Employee.new(
    full_name: "Hetor Salinas",
    country: "Colombia",
    region: "Reynosa, Tamaulipas, Mexico",
    document_id: "123456",
    contact: "x123456",
    experience: "2 años",
    user_id: 4
  )
    employee.cover.attach(io: URI.open("https://cdn-icons-png.flaticon.com/512/1432/1432472.png"), filename: "employee")
    puts employee.errors.full_messages unless employee.save
  puts "Empoyee seeding end"
# ======================= [CREATE Customer] =======================
  puts "Seeding Customers..."
  customer = Customer.new(
    full_name: "John Doe",
    document_type: "CC",
    client_type: "Persona",
    document_id: "1234567",
    birth_date: "1998-01-10",
    region: "Tamaulipas",
    cod_refer: "88930",
    user_id: 2,
    country: "Mexico",
    document_type: "INE"
  )
    customer.cover.attach(io: URI.open("https://www.pngplay.com/wp-content/uploads/1/Businessman-PNG-Clipart-Background.png"), filename: "Customer")
    puts customer.errors.full_messages unless customer.save
  puts "Admins seeding end"
# ======================= [CREATE ADMIN]=======================
  puts "Seeding Admins..."
  admin = Admin.new(
    nickname: "Testino",
    role: "admin",
    user_id: 5
  )
    admin.cover.attach(io: URI.open("https://www.aldiabodegascertificadas.com/wp-content/uploads/2016/09/empresario-inticap.png"), filename: "admin")
    puts admin.errors.full_messages unless admin.save
  puts "Admin seeding end"
# ======================= [CREATE CATEGORY]=======================
  puts "Seeding Categories..."
    categories = Category.new(category_name: "Cuidados", price_col_complete: 250000.25, price_spain: 16.45, region: "Colombia", sector_id: 1)
    categories.image.attach(io: URI.open("https://domesticapp-storage.s3.us-east-2.amazonaws.com/categories/cat2.svg"), filename: "cat1")
    puts categories.errors.full_messages unless categories.save
    categories = Category.new(category_name: "Niñera", price_col_complete: 200000, region: "Colombia", sector_id: 1)
    categories.image.attach(io: URI.open("https://domesticapp-storage.s3.us-east-2.amazonaws.com/categories/cat1cat1.svg"), filename: "cat2")
    puts categories.errors.full_messages unless categories.save

  puts "Category seeding end"
# ======================= [CREATE SERVICE]=======================
  puts "Seeding Services..."
  service_data.each do |service_data|
    new_user = Service.new(service_data)
    puts new_user.errors.full_messages unless new_user.save
  end
  puts "Service seeding end"
# ======================= [CREATE EmployeeCategory]=======================
  puts "Seeding Employee - Categories..."
  employee_category_data.each do |employee_category_data|
    new_user = EmployeeCategory.new(employee_category_data)
    puts new_user.errors.full_messages unless new_user.save
  end
  puts "Employee - Category seeding end"
# ======================= [CREATE ORDER]=======================
  puts "Seeding Orders..."
  order_data.each do |order_data|
    new_user = OrderDetail.new(order_data)
    puts new_user.errors.full_messages unless new_user.save
  end
  puts "Order seeding end"
# ======================= [CREATE CUPON]=======================
  puts "Seeding Cupons..."
  cupon_data.each do |cupon_data|
    new_user = Cupon.new(cupon_data)
    puts new_user.errors.full_messages unless new_user.save
  end
  puts "Cupon seeding end"
# ======================= [CREATE USER CUPON]=======================
  puts "Seeding User Cupons..."
  cupon_user_data.each do |cupon_user_data|
    new_user = CuponUser.new(cupon_user_data)
    puts new_user.errors.full_messages unless new_user.save
  end
  puts "User Cupon seeding end"
# ======================= [CREATE USER REVEIW]=======================
  puts "Seeding Rviews..."
  review_data.each do |review_data|
    new_user = Review.new(review_data)
    puts new_user.errors.full_messages unless new_user.save
  end
  puts "Review seeding end"
# ======================= [CREATE HABILITY]=======================
  puts "Seeding Habilities..."
  hability = Hability.new(
    hability: "Barrer",
    body: "Sabe barrer, deja los lugares impcables sin ninguna mota de polvo",
    score: 2
  )
  hability.image.attach(io: URI.open("https://domesticapp-storage.s3.us-east-2.amazonaws.com/skills/award.png"), filename: "S1")
  puts hability.errors.full_messages unless hability.save
  hability = Hability.new(
    hability: "Puntual",
    body: "Llega puntual a todas sus labores sin expeción",
    score: 4
  )
    hability.image.attach(io: URI.open("https://domesticapp-storage.s3.us-east-2.amazonaws.com/skills/badge.png"), filename: "S1")
    puts hability.errors.full_messages unless hability.save
  hability = Hability.new(
    hability: "Autodidacta",
    body: "Realiza todas sus labores sin nececidad de apoyo",
    score: 5
  )
    hability.image.attach(io: URI.open("https://domesticapp-storage.s3.us-east-2.amazonaws.com/skills/like.png"), filename: "S1")
    puts hability.errors.full_messages unless hability.save
    hability = Hability.new(
      hability: "Servicial",
      body: "Siempre da una buena cara y ayuda a la causa",
      score: 4
    )
      hability.image.attach(io: URI.open("https://domesticapp-storage.s3.us-east-2.amazonaws.com/skills/medal.png"), filename: "S1")
      puts hability.errors.full_messages unless hability.save
  puts "Habilty seeding end"
# ======================= [CREATE Hability Employee]=======================
  puts "Seeding Habilities Employees..."
  hability_employee_data.each do |hability_employee_data|
    new_user = HabilityEmployee.new(hability_employee_data)
    puts new_user.errors.full_messages unless new_user.save
  end
  puts "Habilities Employee seeding end"
# ======================= [CREATE PRACTICE]=======================
  puts "Seeding PRACTICE..."
  practice_data.each do |practice_data|
    new_user = Practice.new(practice_data)
    puts new_user.errors.full_messages unless new_user.save
  end
  puts "PRACTICE seeding end"

# ======================= [CREATE ADDRESS]=======================
  puts "Seeding address..."
  address_data.each do |address_data|
    new_user = Address.new(address_data)
    puts new_user.errors.full_messages unless new_user.save
  end
  puts "Address seeding end"
# ======================= [CREATE NOTIFICATION]=======================
  puts "Seeding notifications..."
  notification_data.each do |notification_data|
    notification = CustomerNotification.new(notification_data)
    puts notification.errors.full_messages unless notification.save
  end
  puts "notifications seeding end"
# ======================= [CREATE FAVORITE]=======================
  puts "Seeding Favorites..."
  favorites_data.each do |favorites_data|
    favorites = Favorite.new(favorites_data)
    puts favorites.errors.full_messages unless favorites.save
  end
 puts "Favorites seeding end"


 news= Newslatter.new(title: "Notiticia 1", body: "lorem ipsum dolor sit amet, consectetur adip")
 puts news.errors.full_messages unless news.save
 puts "Seeding Finished"


 # ======================= [CREATE REPORT]=======================
 puts "Seeding Categories..."
 categories = Report.new(body: "El empleado no se presentó a trabajar", customer_id: 1, employee_id: 1)
 categories.cover.attach(io: URI.open("https://domesticapp-storage.s3.us-east-2.amazonaws.com/categories/cat2.svg"), filename: "cat1")
 puts categories.errors.full_messages unless categories.save

puts "Category seeding end"