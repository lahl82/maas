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

block_lu17 = ct1.days.find_by(name: 'lunes').blocks.find_by(hour: 17)
block_lu18 = ct1.days.find_by(name: 'lunes').blocks.find_by(hour: 18)
block_lu19 = ct1.days.find_by(name: 'lunes').blocks.find_by(hour: 19)
block_ma17 = ct1.days.find_by(name: 'martes').blocks.find_by(hour: 17)
block_ma18 = ct1.days.find_by(name: 'martes').blocks.find_by(hour: 18)
block_ma19 = ct1.days.find_by(name: 'martes').blocks.find_by(hour: 19)
block_ma20 = ct1.days.find_by(name: 'martes').blocks.find_by(hour: 20)
block_mi17 = ct1.days.find_by(name: 'miercoles').blocks.find_by(hour: 17)
block_mi18 = ct1.days.find_by(name: 'miercoles').blocks.find_by(hour: 18)
block_mi19 = ct1.days.find_by(name: 'miercoles').blocks.find_by(hour: 19)
block_mi20 = ct1.days.find_by(name: 'miercoles').blocks.find_by(hour: 20)
block_mi21 = ct1.days.find_by(name: 'miercoles').blocks.find_by(hour: 21)
block_ju17 = ct1.days.find_by(name: 'jueves').blocks.find_by(hour: 17)
block_ju18 = ct1.days.find_by(name: 'jueves').blocks.find_by(hour: 18)
block_ju19 = ct1.days.find_by(name: 'jueves').blocks.find_by(hour: 19)
block_ju20 = ct1.days.find_by(name: 'jueves').blocks.find_by(hour: 20)
block_vi17 = ct1.days.find_by(name: 'viernes').blocks.find_by(hour: 17)
block_vi18 = ct1.days.find_by(name: 'viernes').blocks.find_by(hour: 18)
block_sa21 = ct1.days.find_by(name: 'sabado').blocks.find_by(hour: 21)

week_3 = Api::V1::Week.find_by(number: 3)
week_4 = Api::V1::Week.find_by(number: 4)

technician_bar = Api::V1::Technician.find_by(name: 'Barbara')
technician_ern = Api::V1::Technician.find_by(name: 'Ernesto')
technician_ben = Api::V1::Technician.find_by(name: 'Benjamin')


# CONTRACT 1 - WEEK 3
##############################################################
# Disponibilidad de Barbara - 12 horas la semana 3 contrato 1#
# lunes
Api::V1::Available.create!(block: block_lu17, week: week_3, technician: technician_bar, contract: ct1)
Api::V1::Available.create!(block: block_lu18, week: week_3, technician: technician_bar, contract: ct1)
Api::V1::Available.create!(block: block_lu19, week: week_3, technician: technician_bar, contract: ct1)
# martes
Api::V1::Available.create!(block: block_ma17, week: week_3, technician: technician_bar, contract: ct1)
Api::V1::Available.create!(block: block_ma18, week: week_3, technician: technician_bar, contract: ct1)
# miercoles
Api::V1::Available.create!(block: block_mi17, week: week_3, technician: technician_bar, contract: ct1)
Api::V1::Available.create!(block: block_mi18, week: week_3, technician: technician_bar, contract: ct1)
Api::V1::Available.create!(block: block_mi19, week: week_3, technician: technician_bar, contract: ct1)
Api::V1::Available.create!(block: block_mi20, week: week_3, technician: technician_bar, contract: ct1)
# jueves
Api::V1::Available.create!(block: block_ju19, week: week_3, technician: technician_bar, contract: ct1)
Api::V1::Available.create!(block: block_ju20, week: week_3, technician: technician_bar, contract: ct1)
# sabado
Api::V1::Available.create!(block: block_sa21, week: week_3, technician: technician_bar, contract: ct1)

##############################################################
# Disponibilidad de Ernesto - 11 horas la semana 3 contrato 1#
# lunes
Api::V1::Available.create!(block: block_lu17, week: week_3, technician: technician_ern, contract: ct1)
Api::V1::Available.create!(block: block_lu18, week: week_3, technician: technician_ern, contract: ct1)
Api::V1::Available.create!(block: block_lu19, week: week_3, technician: technician_ern, contract: ct1)
# martes
Api::V1::Available.create!(block: block_ma19, week: week_3, technician: technician_ern, contract: ct1)
Api::V1::Available.create!(block: block_ma20, week: week_3, technician: technician_ern, contract: ct1)
# miercoles
Api::V1::Available.create!(block: block_mi19, week: week_3, technician: technician_ern, contract: ct1)
Api::V1::Available.create!(block: block_mi20, week: week_3, technician: technician_ern, contract: ct1)
Api::V1::Available.create!(block: block_mi21, week: week_3, technician: technician_ern, contract: ct1)
# jueves
Api::V1::Available.create!(block: block_ju18, week: week_3, technician: technician_ern, contract: ct1)
Api::V1::Available.create!(block: block_ju19, week: week_3, technician: technician_ern, contract: ct1)
# sabado
Api::V1::Available.create!(block: block_sa21, week: week_3, technician: technician_ern, contract: ct1)

##############################################################
# Disponibilidad de Benjamin - 15 horas la semana 3 contrato 1#
# lunes
Api::V1::Available.create!(block: block_lu17, week: week_3, technician: technician_ben, contract: ct1)
Api::V1::Available.create!(block: block_lu18, week: week_3, technician: technician_ben, contract: ct1)
# martes
Api::V1::Available.create!(block: block_ma18, week: week_3, technician: technician_ben, contract: ct1)
Api::V1::Available.create!(block: block_ma19, week: week_3, technician: technician_ben, contract: ct1)
# miercoles
Api::V1::Available.create!(block: block_mi17, week: week_3, technician: technician_ben, contract: ct1)
Api::V1::Available.create!(block: block_mi18, week: week_3, technician: technician_ben, contract: ct1)
Api::V1::Available.create!(block: block_mi19, week: week_3, technician: technician_ben, contract: ct1)
Api::V1::Available.create!(block: block_mi20, week: week_3, technician: technician_ben, contract: ct1)
Api::V1::Available.create!(block: block_mi21, week: week_3, technician: technician_ben, contract: ct1)
# jueves
Api::V1::Available.create!(block: block_ju17, week: week_3, technician: technician_ben, contract: ct1)
Api::V1::Available.create!(block: block_ju18, week: week_3, technician: technician_ben, contract: ct1)
Api::V1::Available.create!(block: block_ju19, week: week_3, technician: technician_ben, contract: ct1)
Api::V1::Available.create!(block: block_ju20, week: week_3, technician: technician_ben, contract: ct1)
# viernes
Api::V1::Available.create!(block: block_vi17, week: week_3, technician: technician_ben, contract: ct1)
Api::V1::Available.create!(block: block_vi18, week: week_3, technician: technician_ben, contract: ct1)

# CONTRACT 2 - WEEK 3
##############################################################
# Disponibilidad de Barbara - 12 horas la semana 3 contrato 1#
# lunes
Api::V1::Available.create!(block: block_lu17, week: week_3, technician: technician_bar, contract: ct2)
Api::V1::Available.create!(block: block_lu18, week: week_3, technician: technician_bar, contract: ct2)
Api::V1::Available.create!(block: block_lu19, week: week_3, technician: technician_bar, contract: ct2)
# martes
Api::V1::Available.create!(block: block_ma17, week: week_3, technician: technician_bar, contract: ct2)
Api::V1::Available.create!(block: block_ma18, week: week_3, technician: technician_bar, contract: ct2)
# miercoles
Api::V1::Available.create!(block: block_mi17, week: week_3, technician: technician_bar, contract: ct2)
Api::V1::Available.create!(block: block_mi18, week: week_3, technician: technician_bar, contract: ct2)
Api::V1::Available.create!(block: block_mi19, week: week_3, technician: technician_bar, contract: ct2)
Api::V1::Available.create!(block: block_mi20, week: week_3, technician: technician_bar, contract: ct2)
# jueves
Api::V1::Available.create!(block: block_ju19, week: week_3, technician: technician_bar, contract: ct2)
Api::V1::Available.create!(block: block_ju20, week: week_3, technician: technician_bar, contract: ct2)
# sabado
Api::V1::Available.create!(block: block_sa21, week: week_3, technician: technician_bar, contract: ct2)

##############################################################
# Disponibilidad de Ernesto - 11 horas la semana 3 contrato 1#
# lunes
Api::V1::Available.create!(block: block_lu17, week: week_3, technician: technician_ern, contract: ct2)
Api::V1::Available.create!(block: block_lu18, week: week_3, technician: technician_ern, contract: ct2)
Api::V1::Available.create!(block: block_lu19, week: week_3, technician: technician_ern, contract: ct2)
# martes
Api::V1::Available.create!(block: block_ma19, week: week_3, technician: technician_ern, contract: ct2)
Api::V1::Available.create!(block: block_ma20, week: week_3, technician: technician_ern, contract: ct2)
# miercoles
Api::V1::Available.create!(block: block_mi19, week: week_3, technician: technician_ern, contract: ct2)
Api::V1::Available.create!(block: block_mi20, week: week_3, technician: technician_ern, contract: ct2)
Api::V1::Available.create!(block: block_mi21, week: week_3, technician: technician_ern, contract: ct2)
# jueves
Api::V1::Available.create!(block: block_ju18, week: week_3, technician: technician_ern, contract: ct2)
Api::V1::Available.create!(block: block_ju19, week: week_3, technician: technician_ern, contract: ct2)
# sabado
Api::V1::Available.create!(block: block_sa21, week: week_3, technician: technician_ern, contract: ct2)

##############################################################
# Disponibilidad de Benjamin - 15 horas la semana 3 contrato 1#
# lunes
Api::V1::Available.create!(block: block_lu17, week: week_3, technician: technician_ben, contract: ct2)
Api::V1::Available.create!(block: block_lu18, week: week_3, technician: technician_ben, contract: ct2)
# martes
Api::V1::Available.create!(block: block_ma18, week: week_3, technician: technician_ben, contract: ct2)
Api::V1::Available.create!(block: block_ma19, week: week_3, technician: technician_ben, contract: ct2)
# miercoles
Api::V1::Available.create!(block: block_mi17, week: week_3, technician: technician_ben, contract: ct2)
Api::V1::Available.create!(block: block_mi18, week: week_3, technician: technician_ben, contract: ct2)
Api::V1::Available.create!(block: block_mi19, week: week_3, technician: technician_ben, contract: ct2)
Api::V1::Available.create!(block: block_mi20, week: week_3, technician: technician_ben, contract: ct2)
Api::V1::Available.create!(block: block_mi21, week: week_3, technician: technician_ben, contract: ct2)
# jueves
Api::V1::Available.create!(block: block_ju17, week: week_3, technician: technician_ben, contract: ct2)
Api::V1::Available.create!(block: block_ju18, week: week_3, technician: technician_ben, contract: ct2)
Api::V1::Available.create!(block: block_ju19, week: week_3, technician: technician_ben, contract: ct2)
Api::V1::Available.create!(block: block_ju20, week: week_3, technician: technician_ben, contract: ct2)
# viernes
Api::V1::Available.create!(block: block_vi17, week: week_3, technician: technician_ben, contract: ct2)
Api::V1::Available.create!(block: block_vi18, week: week_3, technician: technician_ben, contract: ct2)

p 'Creados los siguientes registros:'
p "#{Api::V1::Contract.count} Contracts"
p "#{Api::V1::Day.count} Days"
p "#{Api::V1::Block.count} Blocks"
p "#{Api::V1::Week.count} Weeks"
p "#{Api::V1::Technician.count} Technicians"
p "#{Api::V1::Available.count} Availables"
p "#{Api::V1::Allocation.count} Allocations"
p 'Seeding finalizada'
