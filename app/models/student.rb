class Student < User
  belongs_to :producer
  belongs_to :instructor
  belongs_to :course
end