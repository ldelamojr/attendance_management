# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create([{id: 1, name: "Jason Booras", email: "jasonbooras@gmail.com", password: "123", phone: "212-123-4567", type: "Student"},
             {id: 2, name: "Dana Gill", email: "DanaG@gmail.com", password: "123", phone: "212-123-4567", type: "Student"},
             {id: 3, name: "Ismail Jaafari", email: "IsmailJ@gmail.com", password: "123", phone: "212-123-4567", type: "Student"},
             {id: 4, name: "Sara Abbasi", email: "SaraA@gmail.com", password: "123", phone: "212-123-4567", type: "Student"},
             {id: 5, name: "Zachary Boyd", email: "ZacharyB@gmail.com", password: "123", phone: "212-123-4567", type: "Student"},
             {id: 6, name: "Jason Chan", email: "JasonC@gmail.com", password: "123", phone: "212-123-4567", type: "Student"},
             {id: 7, name: "Peter Cirincione", email: "PeterC@gmail.com", password: "123", phone: "212-123-4567", type: "Student"},
             {id: 8, name: "Fatima Faloye", email: "FatimaF@gmail.com", password: "123", phone: "212-123-4567", type: "Student"},
             {id: 9, name: "Leonel Delamo Jr.", email: "LeonelD@gmail.com", password: "123", phone: "212-123-4567", type: "Student"},
             {id: 10, name: "Diana Frank", email: "DianaF@gmail.com", password: "123", phone: "212-123-4567", type: "Student"},
             {id: 11, name: "Ruth Acosta", email: "RuthA@gmail.com", password: "123", phone: "212-123-4567", type: "Student"},
             {id: 12, name: "Eric Boateng", email: "EricB@gmail.com", password: "123", phone: "212-123-4567", type: "Student"},
             {id: 13, name: "Josue Cardona", email: "JosueC@gmail.com", password: "123", phone: "212-123-4567", type: "Student"},
             {id: 14, name: "Jeselin Castillo", email: "JeselinC@gmail.com", password: "123", phone: "212-123-4567", type: "Student"},
             {id: 15, name: "Louis Di Meglio", email: "LouisD@gmail.com", password: "123", phone: "212-123-4567", type: "Student"},
             {id: 16, name: "Brandon Goldenberg", email: "BrandonG@gmail.com", password: "123", phone: "212-123-4567", type: "Student"},
             {id: 17, name: "Shawn Hanna", email: "ShawnH@gmail.com", password: "123", phone: "212-123-4567", type: "Student"},
             {id: 18, name: "Michael L. Clair", email: "MichaelL@gmail.com", password: "123", phone: "212-123-4567", type: "Student"},
             {id: 19, name: "Dan Lynn", email: "DanL@gmail.com", password: "123", phone: "212-123-4567", type: "Student"},
             {id: 20, name: "Chris Mahr", email: "ChrisM@gmail.com", password: "123", phone: "212-123-4567", type: "Student"},
             {id: 21, name: "Esther Mohadeb", email: "EstherM@gmail.com", password: "123", phone: "212-123-4567", type: "Student"},
             {id: 22, name: "Jared Murphy", email: "JaredM@gmail.com", password: "123", phone: "212-123-4567", type: "Student"},
             {id: 23, name: "Danielle Nourok", email: "DanielleN@gmail.com", password: "123", phone: "212-123-4567", type: "Student"},
             {id: 24, name: "Angela Perez", email: "AngelaP@gmail.com", password: "123", phone: "212-123-4567", type: "Student"},
             {id: 25, name: "Nicolai Robles", email: "NicolaiR@gmail.com", password: "123", phone: "212-123-4567", type: "Student"},
             {id: 26, name: "John Bell", email: "JaredM@gmail.com", password: "123", phone: "212-123-4567", type: "Instructor"},
             {id: 27, name: "Jaden Carver", email: "JadenC@gmail.com", password: "123", phone: "212-123-4567", type: "Instructor"},
             {id: 28, name: "Dennis Liaw", email: "DennisL@gmail.com", password: "123", phone: "212-123-4567", type: "Instructor"},
             {id: 29, name: "Bryan Mytko", email: "BryanM@gmail.com", password: "123", phone: "212-123-4567", type: "Instructor"},
             {id: 30, name: "Bobby King", email: "BobbyK@gmail.com", password: "123", phone: "212-123-4567", type: "Instructor"},
             {id: 31, name: "Ethan Barhydt", email: "EthanB@gmail.com", password: "123", phone: "212-123-4567", type: "Producer"}
             ])


Course.create([{id: 1, name: "Blue Steel"},
               {id: 2, name: "Magnum"},
               {id: 3, name: "Rubber Duck"},
               {id: 4, name: "Night's Watch"},
               {id: 5, name: "Burrito"}
              ])


CourseUser.create([{id: 1, user_id: 1, course_id: 1},
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
                  ])


Attendance.create([{id: 1, danger: true, status: "late", date: 38.days.ago, user_id: 1, course_id: 1},
                   {id: 2, danger: false, status: "late", date: 37.days.ago, user_id: 1, course_id: 1},
                   {id: 3, danger: false, status: "late", date: 36.days.ago, user_id: 1, course_id: 1},
                   {id: 4, danger: false, status: "unexcused", date: 35.days.ago, user_id: 1, course_id: 1},
                   {id: 5, danger: false, status: "unexcused", date: 34.days.ago, user_id: 1, course_id: 1},
                   {id: 6, danger: false, status: "late", date: 38.days.ago, user_id: 2, course_id: 1},
                   {id: 7, danger: false, status: "late", date: 37.days.ago, user_id: 2, course_id: 1},
                   {id: 8, danger: false, status: "late", date: 36.days.ago, user_id: 2, course_id: 1},
                   {id: 9, danger: false, status: "late", date: 35.days.ago, user_id: 2, course_id: 1},
                   {id: 10, danger: false, status: "late", date: 34.days.ago, user_id: 2, course_id: 1},
                   {id: 11, danger: false, status: "late", date: 38.days.ago, user_id: 7, course_id: 2},
                   {id: 12, danger: false,  status: "late", date: 37.days.ago, user_id: 7, course_id: 2},
                   {id: 13, danger: false, status: "excused", date: 38.days.ago, user_id: 8, course_id: 2},
                   {id: 14, danger: true, status: "unexcused", date: 37.days.ago, user_id: 20, course_id: 5},
                   {id: 15, danger: false, status: "unexcused", date: 36.days.ago, user_id: 20, course_id: 5},
                   {id: 16, danger: false, status: "unexcused", date: 35.days.ago, user_id: 20, course_id: 5},
                   {id: 17, danger: false, status: "excused", date: 34.days.ago, user_id: 20, course_id: 5},
                   {id: 18, danger: false, status: "late", date: 38.days.ago, user_id: 13, course_id: 3},
                   {id: 19, danger: false, status: "late", date: 37.days.ago, user_id: 13, course_id: 3},
                   {id: 20, danger: false, status: "late", date: 36.days.ago, user_id: 13, course_id: 3},
                   {id: 21, danger: false, status: "excused", date: 38.days.ago, user_id: 16, course_id: 4},
                   {id: 22, danger: false, status: "unexcused", date: 37.days.ago, user_id: 17, course_id: 4},
                   {id: 23, danger: false, status: "unexcused", date: 36.days.ago, user_id: 18, course_id: 4},
                   {id: 24, danger: false, status: "late", date: 35.days.ago, user_id: 19, course_id: 4}
                  ])
