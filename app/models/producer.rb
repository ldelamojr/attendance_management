class Producer < User
  has_many :instructors
  has_many :students
  has_many :courses
end