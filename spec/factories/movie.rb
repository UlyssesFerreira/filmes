FactoryBot.define do
  factory :movie do
    title { "Ainda Estou Aqui" }
    original_title { "Ainda Estou Aqui" }
    description { "No início da década de 1970, o Brasil enfrenta o endurecimento da ditadura militar. No Rio de Janeiro, a família Paiva - Rubens, Eunice e seus cinco filhos - vive à beira da praia em uma casa de portas abertas para os amigos. Um dia, Rubens Paiva é levado por militares à paisana e desaparece." }
    release_date { "Thu, 19 Sep 2024" }
    poster_url { "https://image.tmdb.org/t/p/w500/zNAw7jK8bwCK56rIW676pdgkwhd.jpg" }
    rating { 7.96 }
    status { "Released" }
    runtime { 135 }
    original_language { "pt" }
  end
end
