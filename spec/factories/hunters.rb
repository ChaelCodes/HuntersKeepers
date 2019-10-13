FactoryBot.define do
  factory :hunter do
    playbook
    harm { 0 }
    luck { 7 }
    charm { 1 }
    cool { 2 }
    sharp { 1 }
    tough { 1 }
    weird { -1 }
  end
end
