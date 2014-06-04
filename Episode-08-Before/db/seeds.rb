# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

[Crew].each &:destroy_all

Crew.create([
  { name: "Philip J. Fry",                  title: "Executive Delivery Boy",                         age: 27,    avatar: "fry.jpg",        species: "Human",       origin: "Earth" },
  { name: "Turanga Leela",                  title: "Captain",                                        age: 37,    avatar: "leela.jpg",      species: "Mutant",      origin: "Earth" },
  { name: "Any Wong",                       title: "Intern",                                         age: 33,    avatar: "amy.jpg",        species: "Human",       origin: "Mars" },
  { name: "Bender Bending Rodriguez",       title: "One of the company's most expensive appliances", age: 17,    avatar: "bender.jpg",     species: "Robot",       origin: "Earth" },
  { name: "Dr. John A. Zoidberg",           title: "Staff Doctor",                                   age: 86,    avatar: "zoidberg.jpg",   species: "Decapodian",  origin: "Decapod 10" },
  { name: "Hermes Conrad",                  title: "Bureaucrat",                                     age: 54,    avatar: "hermes.jpg",     species: "Human",       origin: "Earth" },
  { name: "Lord Nibbler",                   title: "unknown",                                        age: 3285,  avatar: "nibbler.jpg",    species: "Nibblonian",  origin: "Eternium, Vergon 6" },
  { name: "Professor Hubert J. Farnsworth", title: "Owner / CEO",                                    age: 210,   avatar: "farnsworth.jpg", species: "Human",       origin: "Earth" },
  { name: "Scruffy Scruffington",           title: "Janitor",                                        age: 55,    avatar: "scruffy.jpg",    species: "Undead",      origin: "Earth" },
])