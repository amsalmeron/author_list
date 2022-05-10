# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Author.destroy_all

saifedean = Author.create!(name: 'Saifedean Ammous', age: 50, alive: true)
rowling = Author.create!(name: 'J.K.Rowling', age: 60, alive: true)
plato = Author.create!(name: 'Plato', age: 30, alive: false)
ayn = Author.create!(name: 'Ayn Rand', age: 20, alive: false)

bitcoin = saifedean.books.create!(title: 'The Bitcoin Standard', page_count: 300, fiction: false)
fiat = saifedean.books.create!(title: 'The Fiat Standard', page_count: 250, fiction: false)

sorcerer = rowling.books.create!(title: "The Sorcerer's Stone", page_count: 500, fiction: true)
goblet = rowling.books.create!(title: "The Goblet of Fire", page_count: 550, fiction: true)
prisoner = rowling.books.create!(title: "Prisoner of Askaban", page_count: 600, fiction: true)

republic = plato.books.create!(title: 'Republic', page_count: 100, fiction: false)
cave = plato.books.create!(title: 'Allegory of the Cave', page_count: 50, fiction: true)

atlas = ayn.books.create!(title: 'Atlas Shrugged', page_count: 300, fiction: true)
anthem = ayn.books.create!(title: 'Anthem', page_count: 200, fiction: true)