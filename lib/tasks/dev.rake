namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do

    puts "Cadastrando tipos de contatos!"

    kinds = %w(Amigo Comercial Conhecido)

    kinds.each do |kind|
      Kind.create!(
        description: kind
      )
    end

    puts "Tipos cadastrados"

    puts "Cadastrando os contatos..."
    100.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.birthday(min_age: 18, max_age: 65),
        kind: Kind.all.sample
      )
    end
    puts "Contatos cadastrados com sucesso!"
  end

end
