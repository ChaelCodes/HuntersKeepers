FactoryBot.define do
  factory :move do
    type { Moves::Basic }
    name { 'Act Under Pressure' }
    rating { 1 } # Cool
    six_and_under { 'six and under result '}
    seven_to_nine { 'seven to nine result' }
    ten_plus { 'ten plus result' }
    twelve_plus { 'advanced moves only' }
  end
end
