FactoryBot.define do
  factory :tracking do
    email 'cf.marques@live.com'
    accessed_pages [{ url: 'https://www.resultadosdigitais.com.br/', pathname: '/', datetime: DateTime.current }]

    factory :invalid_tracking do
      email ''
      accessed_pages []
    end
  end
end
