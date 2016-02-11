# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create [{id: 1, name: "Jason Booras", email: "JasonB@gmail.com", password_digest: "123", phone: "212-123-4567", type: "Student", danger: true},
             {id: 2, name: "Dana Gill", email: "DanaG@gmail.com", password_digest: "123", phone: "212-123-4567", type: "Student", danger: false},
             {id: 3, name: "Ismail Jaafari", email: "IsmailJ@gmail.com", password_digest: "123", phone: "212-123-4567", type: "Student", danger: false},
             {id: 4, name: "Sara Abbasi", email: "SaraA@gmail.com", password_digest: "123", phone: "212-123-4567", type: "Student", danger: false},
             {id: 5, name: "Zachary Boyd", email: "ZacharyB@gmail.com", password_digest: "123", phone: "212-123-4567", type: "Student", danger: false},
             {id: 6, name: "Jason Chan", email: "JasonC@gmail.com", password_digest: "123", phone: "212-123-4567", type: "Student", danger: false},
             {id: 7, name: "Peter Cirincione", email: "PeterC@gmail.com", password_digest: "123", phone: "212-123-4567", type: "Student", danger: false},
             {id: 8, name: "Fatima Faloye", email: "FatimaF@gmail.com", password_digest: "123", phone: "212-123-4567", type: "Student", danger: false}, 
             {id: 9, name: "Leonel Delamo Jr.", email: "LeonelD@gmail.com", password_digest: "123", phone: "212-123-4567", type: "Student", danger: false},
             {id: 10, name: "Diana Frank", email: "DianaF@gmail.com", password_digest: "123", phone: "212-123-4567", type: "Student", danger: false},
             {id: 11, name: "Ruth Acosta", email: "RuthA@gmail.com", password_digest: "123", phone: "212-123-4567", type: "Student", danger: false},
             {id: 12, name: "Eric Boateng", email: "EricB@gmail.com", password_digest: "123", phone: "212-123-4567", type: "Student", danger: false},
             {id: 13, name: "Josue Cardona", email: "JosueC@gmail.com", password_digest: "123", phone: "212-123-4567", type: "Student", danger: false},
             {id: 14, name: "Jeselin Castillo", email: "JeselinC@gmail.com", password_digest: "123", phone: "212-123-4567", type: "Student", danger: false},
             {id: 15, name: "Louis Di Meglio", email: "LouisD@gmail.com", password_digest: "123", phone: "212-123-4567", type: "Student", danger: false}, 
             {id: 16, name: "Brandon Goldenberg", email: "BrandonG@gmail.com", password_digest: "123", phone: "212-123-4567", type: "Student", danger: false},
             {id: 17, name: "Shawn Hanna", email: "ShawnH@gmail.com", password_digest: "123", phone: "212-123-4567", type: "Student", danger: false},
             {id: 18, name: "Michael L. Clair", email: "MichaelL@gmail.com", password_digest: "123", phone: "212-123-4567", type: "Student", danger: false},
             {id: 19, name: "Dan Lynn", email: "DanL@gmail.com", password_digest: "123", phone: "212-123-4567", type: "Student", danger: false}, 
             {id: 20, name: "Chris Mahr", email: "ChrisM@gmail.com", password_digest: "123", phone: "212-123-4567", type: "Student", danger: true},
             {id: 21, name: "Esther Mohadeb", email: "EstherM@gmail.com", password_digest: "123", phone: "212-123-4567", type: "Student", danger: false},
             {id: 22, name: "Jared Murphy", email: "JaredM@gmail.com", password_digest: "123", phone: "212-123-4567", type: "Student", danger: false},
             {id: 23, name: "Danielle Nourok", email: "DanielleN@gmail.com", password_digest: "123", phone: "212-123-4567", type: "Student", danger: false},
             {id: 24, name: "Angela Perez", email: "AngelaP@gmail.com", password_digest: "123", phone: "212-123-4567", type: "Student", danger: false},
             {id: 25, name: "Nicolai Robles", email: "NicolaiR@gmail.com", password_digest: "123", phone: "212-123-4567", type: "Student", danger: false},
             {id: 26, name: "John Bell", email: "JaredM@gmail.com", password_digest: "123", phone: "212-123-4567", type: "Instructor", danger: false},
             {id: 27, name: "Jaden Carver", email: "DanielleN@gmail.com", password_digest: "123", phone: "212-123-4567", type: "Instructor", danger: false},
             {id: 28, name: "Dennis Liaw", email: "AngelaP@gmail.com", password_digest: "123", phone: "212-123-4567", type: "Instructor", danger: false},
             {id: 29, name: "Bryan Mytko", email: "NicolaiR@gmail.com", password_digest: "123", phone: "212-123-4567", type: "Instructor", danger: false},
             {id: 30, name: "Bobby King", email: "NicolaiR@gmail.com", password_digest: "123", phone: "212-123-4567", type: "Instructor", danger: false},
             {id: 31, name: "Ethan Barhydt", email: "EthanB@gmail.com", password_digest: "123", phone: "212-123-4567", type: "Producer", danger: false}
             ]


Course.create [{id: 1, name: "Blue Steel"},
               {id: 2, name: "Magnum"},
               {id: 3, name: "Rubber Duck"},
               {id: 4, name: "Night's Watch"},
               {id: 5, name: "Burrito"}
              ]


CourseUser.create [{id: 1, user_id: 1, course_id: 1},
                   {id: 2, user_id: 2, course_id: 1},
                   {id: 3, user_id: 3, course_id: 1},
                   {id: 4, user_id: 4, course_id: 1},
                   {id: 5, user_id: 5, course_id: 1},
                   {id: 6, user_id: 6, course_id: 2},
                   {id: 7, user_id: 7, course_id: 2},
                   {id: 8, user_id: 8, course_id: 2},
                   {id: 9, user_id: 9, course_id: 2},
                   {id: 10, user_id: 10, course_id: 2},
                   {id: 11, user_id: 11, course_id: 3},
                   {id: 12, user_id: 12, course_id: 3},
                   {id: 13, user_id: 13, course_id: 3},
                   {id: 14, user_id: 14, course_id: 3},
                   {id: 15, user_id: 15, course_id: 3},
                   {id: 16, user_id: 16, course_id: 4},
                   {id: 17, user_id: 17, course_id: 4},
                   {id: 18, user_id: 18, course_id: 4},
                   {id: 19, user_id: 19, course_id: 4},
                   {id: 20, user_id: 20, course_id: 4},
                   {id: 21, user_id: 21, course_id: 5},
                   {id: 22, user_id: 22, course_id: 5},
                   {id: 23, user_id: 23, course_id: 5},
                   {id: 24, user_id: 24, course_id: 5},
                   {id: 25, user_id: 25, course_id: 5},
                   {id: 26, user_id: 26, course_id: 1},
                   {id: 27, user_id: 27, course_id: 2},
                   {id: 28, user_id: 28, course_id: 3},
                   {id: 29, user_id: 29, course_id: 4},
                   {id: 30, user_id: 30, course_id: 5}
                  ]


Attendance.create [{id: 1, status: "late", date: 38.days.ago, user_id: 1, course_id: 1},
                   {id: 2, status: "late", date: 37.days.ago, user_id: 1, course_id: 1},
                   {id: 3, status: "late", date: 36.days.ago, user_id: 1, course_id: 1},
                   {id: 4, status: "unexcused", date: 35.days.ago, user_id: 1, course_id: 1},
                   {id: 5, status: "unexcused", date: 34.days.ago, user_id: 1, course_id: 1},
                   {id: 6, status: "late", date: 38.days.ago, user_id: 2, course_id: 1},
                   {id: 7, status: "late", date: 37.days.ago, user_id: 2, course_id: 1},
                   {id: 8, status: "late", date: 36.days.ago, user_id: 2, course_id: 1},
                   {id: 9, status: "late", date: 35.days.ago, user_id: 2, course_id: 1},
                   {id: 10, status: "late", date: 34.days.ago, user_id: 2, course_id: 1},
                   {id: 11, status: "late", date: 38.days.ago, user_id: 7, course_id: 2},
                   {id: 12, status: "late", date: 37.days.ago, user_id: 7, course_id: 2},
                   {id: 13, status: "excused", date: 38.days.ago, user_id: 8, course_id: 2},
                   {id: 14, status: "unexcused", date: 37.days.ago, user_id: 20, course_id: 5},
                   {id: 15, status: "unexcused", date: 36.days.ago, user_id: 20, course_id: 5},
                   {id: 16, status: "unexcused", date: 35.days.ago, user_id: 20, course_id: 5},
                   {id: 17, status: "excused", date: 34.days.ago, user_id: 20, course_id: 5},
                   {id: 18, status: "late", date: 38.days.ago, user_id: 13, course_id: 3},
                   {id: 19, status: "late", date: 37.days.ago, user_id: 13, course_id: 3},
                   {id: 20, status: "late", date: 36.days.ago, user_id: 13, course_id: 3},
                   {id: 21, status: "excused", date: 38.days.ago, user_id: 16, course_id: 4},
                   {id: 22, status: "unexcused", date: 37.days.ago, user_id: 17, course_id: 4},
                   {id: 23, status: "unexcused", date: 36.days.ago, user_id: 18, course_id: 4},
                   {id: 24, status: "late", date: 35.days.ago, user_id: 19, course_id: 4}
                  ]
