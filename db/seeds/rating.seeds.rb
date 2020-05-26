# frozen_string_literal: true

after :playbook do
  {
    chosen: [
      { playbook: @chosen, charm: 2, cool: -1, sharp: 1, tough: 2, weird: -1 },
      { playbook: @chosen, charm: -1, cool: 2, sharp: 1, tough: 2, weird: -1 },
      { playbook: @chosen, charm: 1, cool: 2, sharp: 1, tough: 1, weird: -1 },
      { playbook: @chosen, charm: -1, cool: 1, sharp: 2, tough: -1, weird: 2 },
      { playbook: @chosen, charm: 1, cool: 2, sharp: -1, tough: -1, weird: 2 }
    ],
    crooked: [
      { playbook: @crooked, charm: 1, cool: 1, sharp: 2, tough: 0, weird: -1 },
      { playbook: @crooked, charm: -1, cool: 1, sharp: 1, tough: 2, weird: 0 },
      { playbook: @crooked, charm: -1, cool: 2, sharp: 2, tough: 0, weird: -1 },
      { playbook: @crooked, charm: 2, cool: 1, sharp: 1, tough: 0, weird: -1 },
      { playbook: @crooked, charm: 2, cool: 0, sharp: 1, tough: -1, weird: 1 }
    ],
    divine: [
      { playbook: @divine, charm: 1, cool: 1, sharp: -1, tough: 2, weird: 0 },
      { playbook: @divine, charm: -1, cool: 2, sharp: -1, tough: 2, weird: 0 },
      { playbook: @divine, charm: -1, cool: 0, sharp: 1, tough: 2, weird: 1 },
      { playbook: @divine, charm: 1, cool: 1, sharp: 0, tough: 2, weird: -1 },
      { playbook: @divine, charm: -1, cool: 1, sharp: 0, tough: 2, weird: 1 }
    ],
    expert: [
      { playbook: @expert, charm: -1, cool: 1, sharp: 2, tough: 1, weird: 0 },
      { playbook: @expert, charm: 0, cool: 1, sharp: 2, tough: -1, weird: 1 },
      { playbook: @expert, charm: 1, cool: -1, sharp: 2, tough: 1, weird: 0 },
      { playbook: @expert, charm: -1, cool: 1, sharp: 2, tough: 0, weird: 1 },
      { playbook: @expert, charm: -1, cool: 0, sharp: 2, tough: -1, weird: 2 }
    ],
    flake: [
      { playbook: @flake, charm: 1, cool: 1, sharp: 2, tough: -1, weird: 0 },
      { playbook: @flake, charm: 0, cool: 1, sharp: 2, tough: -1, weird: 1 },
      { playbook: @flake, charm: 1, cool: -1, sharp: 2, tough: 1, weird: 0 },
      { playbook: @flake, charm: 1, cool: -1, sharp: 2, tough: 0, weird: 1 },
      { playbook: @flake, charm: -1, cool: -1, sharp: 2, tough: 0, weird: 2 }
    ],
    initiate: [
      { playbook: @initiate, charm: -1, cool: 1, sharp: 0, tough: 1, weird: 2 },
      { playbook: @initiate, charm: 0, cool: 1, sharp: 1, tough: -1, weird: 2 },
      { playbook: @initiate, charm: -1, cool: 0, sharp: -1, tough: 2, weird: 2 },
      { playbook: @initiate, charm: 1, cool: -1, sharp: 1, tough: 0, weird: 2 },
      { playbook: @initiate, charm: 0, cool: 0, sharp: 0, tough: 1, weird: 2 }
    ],
    monstrous: [
      { playbook: @monstrous, charm: -1, cool: -1, sharp: 0, tough: 2, weird: 3 },
      { playbook: @monstrous, charm: -1, cool: 1, sharp: 1, tough: 0, weird: 3 },
      { playbook: @monstrous, charm: 2, cool: 0, sharp: -1, tough: -1, weird: 3 },
      { playbook: @monstrous, charm: -2, cool: 2, sharp: 0, tough: 0, weird: 3 },
      { playbook: @monstrous, charm: 0, cool: -1, sharp: 2, tough: -1, weird: 3 }
    ],
    mundane: [
      { playbook: @mundane, charm: 2, cool: 1, sharp: 0, tough: 1, weird: -1 },
      { playbook: @mundane, charm: 2, cool: -1, sharp: 1, tough: 1, weird: 0 },
      { playbook: @mundane, charm: 2, cool: 0, sharp: -1, tough: 1, weird: 1 },
      { playbook: @mundane, charm: 2, cool: 0, sharp: 1, tough: 1, weird: -1 },
      { playbook: @mundane, charm: 2, cool: 1, sharp: 1, tough: 0, weird: -1 }
    ],
    professional: [
      { playbook: @professional, charm: 0, cool: 2, sharp: -1, tough: 2, weird: -1 },
      { playbook: @professional, charm: -1, cool: 2, sharp: 1, tough: 1, weird: 0 },
      { playbook: @professional, charm: 1, cool: 2, sharp: 1, tough: -1, weird: 0 },
      { playbook: @professional, charm: -1, cool: 2, sharp: 1, tough: 0, weird: 1 },
      { playbook: @professional, charm: 0, cool: 2, sharp: 2, tough: -1, weird: -1 }
    ],
    spell_slinger: [
      { playbook: @spell_slinger, charm: -1, cool: 1, sharp: 1, tough: 0, weird: 2 },
      { playbook: @spell_slinger, charm: 0, cool: -1, sharp: 1, tough: 1, weird: 2 },
      { playbook: @spell_slinger, charm: -1, cool: 0, sharp: 2, tough: -1, weird: 2 },
      { playbook: @spell_slinger, charm: 1, cool: 0, sharp: 1, tough: -1, weird: 2 },
      { playbook: @spell_slinger, charm: 0, cool: 0, sharp: 1, tough: 0, weird: 2 }
    ],
    spooky: [
      { playbook: @spooky, charm: 1, cool: 0, sharp: 1, tough: -1, weird: 2 },
      { playbook: @spooky, charm: -1, cool: 1, sharp: 0, tough: 1, weird: 2 },
      { playbook: @spooky, charm: 2, cool: 0, sharp: -1, tough: -1, weird: 2 },
      { playbook: @spooky, charm: 0, cool: -1, sharp: 1, tough: 1, weird: 2 },
      { playbook: @spooky, charm: -1, cool: -1, sharp: 2, tough: 0, weird: 2 }
    ],
    wronged: [
      { playbook: @wronged, charm: 0, cool: 1, sharp: -1, tough: 2, weird: 1 },
      { playbook: @wronged, charm: 0, cool: 0, sharp: 1, tough: 2, weird: 0 },
      { playbook: @wronged, charm: 1, cool: 0, sharp: 1, tough: 2, weird: -1 },
      { playbook: @wronged, charm: -1, cool: -1, sharp: 0, tough: 2, weird: 2 },
      { playbook: @wronged, charm: 1, cool: -1, sharp: 0, tough: 2, weird: 1 }
    ],
    gumshoe: [
      { playbook: @gumshoe, charm: 2, cool: 0, sharp: 1, tough: 0, weird: 0 },
      { playbook: @gumshoe, charm: 2, cool: 0, sharp: 1, tough: 1, weird: -1 },
      { playbook: @gumshoe, charm: 1, cool: 0, sharp: 2, tough: 1, weird: -1 },
      { playbook: @gumshoe, charm: 1, cool: -1, sharp: 2, tough: 0, weird: 1 },
      { playbook: @gumshoe, charm: 2, cool: 1, sharp: 1, tough: 0, weird: -1 }
    ],
    hex: [
      { playbook: @hex, charm: 2, cool: 0, sharp: -1, tough: -1, weird: 2 },
      { playbook: @hex, charm: 1, cool: -1, sharp: 0, tough: 0, weird: 2 },
      { playbook: @hex, charm: -1, cool: 1, sharp: 1, tough: 1, weird: 2 },
      { playbook: @hex, charm: -1, cool: 0, sharp: 1, tough: 1, weird: 2 },
      { playbook: @hex, charm: 0, cool: 0, sharp: -1, tough: -1, weird: 2 }
    ],
    pararomantic: [
      { playbook: @pararomantic, charm: 2, cool: 1, sharp: 0, tough: -1, weird: 1 },
      { playbook: @pararomantic, charm: 2, cool: -1, sharp: 1, tough: 1, weird: 0 },
      { playbook: @pararomantic, charm: 2, cool: 2, sharp: 0, tough: 0, weird: -1 },
      { playbook: @pararomantic, charm: 2, cool: 1, sharp: 1, tough: -1, weird: 0 },
      { playbook: @pararomantic, charm: 2, cool: 0, sharp: 2, tough: -1, weird: 0 }
    ],
    searcher: [
      { playbook: @searcher, charm: 0, cool: 1, sharp: 1, tough: -1, weird: 2 },
      { playbook: @searcher, charm: 1, cool: -1, sharp: 1, tough: 0, weird: 2 },
      { playbook: @searcher, charm: 0, cool: -1, sharp: 2, tough: 0, weird: 2 },
      { playbook: @searcher, charm: 0, cool: 1, sharp: 2, tough: -1, weird: 1 },
      { playbook: @searcher, charm: 1, cool: 0, sharp: 2, tough: -1, weird: 1 }
    ]
  }.each do |_playbook, ratings|
    ratings.each do |rating|
      Rating.find_or_create_by!(rating)
    end
  end
end
