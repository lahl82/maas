# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# module V1

Api::V1::Available.destroy_all
Api::V1::Allocation.destroy_all
Api::V1::Technician.destroy_all
Api::V1::Week.destroy_all
Api::V1::Block.destroy_all
Api::V1::Day.destroy_all
Api::V1::Contract.destroy_all

ct1 = Api::V1::Contract.create!(
  {
    name: 'Recorrido.cl',
    status: 'true'
  }
)

ct2 = Api::V1::Contract.create!(
  {
    name: 'Falabella',
    status: 'true'
  }
)

ct1.days.create!([{
                   name: 'lunes'
                 },
                  {
                    name: 'martes'
                  },
                  {
                    name: 'miercoles'
                  },
                  {
                    name: 'jueves'
                  },
                  {
                    name: 'viernes'
                  },
                  {
                    name: 'sabado'
                  },
                  {
                    name: 'domingo'
                  }])

(17..21).each do |i|
  ct1.days.find_by(name: 'lunes').blocks.create!(
    hour: i
  )

  ct1.days.find_by(name: 'martes').blocks.create!(
    hour: i
  )

  ct1.days.find_by(name: 'miercoles').blocks.create!(
    hour: i
  )

  ct1.days.find_by(name: 'jueves').blocks.create!(
    hour: i
  )

  ct1.days.find_by(name: 'viernes').blocks.create!(
    hour: i
  )

  ct1.days.find_by(name: 'sabado').blocks.create!(
    hour: i
  )

  ct1.days.find_by(name: 'domingo').blocks.create!(
    hour: i
  )
end

ct2.days.create!([{
                   name: 'lunes'
                 },
                  {
                    name: 'martes'
                  },
                  {
                    name: 'miercoles'
                  },
                  {
                    name: 'jueves'
                  },
                  {
                    name: 'viernes'
                  },
                  {
                    name: 'sabado'
                  },
                  {
                    name: 'domingo'
                  }])

(17..21).each do |i|
  ct2.days.find_by(name: 'lunes').blocks.create!(
    hour: i
  )

  ct2.days.find_by(name: 'martes').blocks.create!(
    hour: i
  )

  ct2.days.find_by(name: 'miercoles').blocks.create!(
    hour: i
  )

  ct2.days.find_by(name: 'jueves').blocks.create!(
    hour: i
  )

  ct2.days.find_by(name: 'viernes').blocks.create!(
    hour: i
  )

  ct2.days.find_by(name: 'sabado').blocks.create!(
    hour: i
  )

  ct2.days.find_by(name: 'domingo').blocks.create!(
    hour: i
  )
end

(1..52).each do |i|
  Api::V1::Week.create!({ number: i })
end

Api::V1::Technician.create!([{
                              name: 'Ernesto', color: '#E6AB4A'
                            },
                             {
                               name: 'Barbara', color: '#DB6D98'
                             },
                             {
                               name: 'Benjamin', color: '#669EEB'
                             }])

block = ct1.days.find_by(name: 'lunes').blocks.first
week = Api::V1::Week.find_by(number: 3)
technician = Api::V1::Technician.find_by(name: 'Barbara')

Api::V1::Available.create!(block:, week:, technician:, contract: ct1)

block = ct2.days.find_by(name: 'martes').blocks.first
week = Api::V1::Week.find_by(number: 48)
technician = Api::V1::Technician.find_by(name: 'Barbara')

Api::V1::Available.create!(block:, week:, technician:, contract: ct2)

p "Creados #{Api::V1::Contract.count} Contracts y dependientes"
