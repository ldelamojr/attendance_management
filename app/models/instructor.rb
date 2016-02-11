class Instructor < User
  has_many :students
  has_many :courses
  belongs_to :producer
end