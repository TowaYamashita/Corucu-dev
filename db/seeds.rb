# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# coding: utf-8

# Statuses
Status.create([
    {:admin_flag => 1},
    {:professor_flag => 1},
    {:student_flag => 1},
    {:guest_flag => 1}
])

# Users
User.create([
    {:username => 'admin',     :email => 'admin@example.com',       :password => 'asdfgh', :confirmed_at => Time.now, :status_id => 1, :admin_user => true},
    {:username => 'professor', :email => 'professor@example.com',  :password => 'aqswde', :confirmed_at => Time.now, :status_id => 2},
    {:username => 'student',   :email => 'student@example.com', :password => 'qxevrb', :confirmed_at => Time.now, :status_id => 3},
    {:username => 'guest',     :email => 'guest@example.com',       :password => 'wvrbth', :confirmed_at => Time.now, :status_id => 4}
])

# Subjects
Subject.create([
    {:course => "A", :instructor => "Alice"},
    {:course => "B", :instructor => "Bob"},
    {:course => "C", :instructor => "Chris"},
    {:course => "D", :instructor => "David"},
    {:course => "E", :instructor => "Elic"}
])

# Substitutes
Substitute.create([
    {:changed_at => "2020-04-04", :period => 1, :subject_id => 1, :user_id => 1, :comment => "This is test message."},
    {:changed_at => "2020-04-05", :period => 2, :subject_id => 2, :user_id => 2, :comment => ""},
    {:changed_at => "2020-04-06", :period => 3, :subject_id => 3, :user_id => 1, :comment => "授業変更"},
    {:changed_at => "2020-04-07", :period => 4, :subject_id => 4, :user_id => 2, :comment => ""},
    {:changed_at => "2020-04-08", :period => 3, :subject_id => 5, :user_id => 1, :comment => "Bobが代わりに講義を行います"}
])

# AddExaminations
AddExamination.create([
    {:scheduled_at => "2020-04-04", :category => "追試", :subject_id => 1, :user_id => 2, :place => "classroom", :comment => "test1"},
    {:scheduled_at => "2020-04-05", :category => "追試", :subject_id => 3, :user_id => 1, :place => "library", :comment => "test2"},
    {:scheduled_at => "2020-04-06", :category => "追試", :subject_id => 5, :user_id => 2, :place => "ict1", :comment => "test3"},
    {:scheduled_at => "2020-04-07", :category => "再試", :subject_id => 2, :user_id => 1, :place => "ict2", :comment => ""},
    {:scheduled_at => "2020-04-08", :category => "再試", :subject_id => 3, :user_id => 2, :place => "labo-A", :comment => "test4"},
    {:scheduled_at => "2020-04-09", :category => "再試", :subject_id => 4, :user_id => 1, :place => "labo-B", :comment => ""}
])