FactoryBot.define do
  factory :tracking do
    email 'cf.marques@live.com'
    accessed_pages [{ url: 'https://www.resultadosdigitais.com.br/', datetime: DateTime.current }]
  end
end
