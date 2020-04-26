# frozen_string_literal: true

module Moves
  class Factory < Move
    #  Artifact: You ‘found’ a magical artifact with handy
    #   powers, and kept it. Pick one: Protective amulet
    #   (1-armour magic recharge)(Gear), Lucky charm (may be
    #   used as a Luck point, once only), Grimoire (studying
    #   the book gives +1 forward to use magic)(Move), Skeleton
    #   key (opens any magically sealed lock)(Move), Imp stone (A
    #   weak demon is bound to serve the holder. The imp
    #   must be summoned with the use magic move)(Move).
    [{ gear: { armor: 1, tags_list: %w[magic recharge] },
      url: '/hunters' },
     { move: {} }]

    # Enchanted Clothing: Pick an article of every-day
    # clothing–it’s enchanted without any change in
    # appearance. Take -1 harm from any source that tries
    # to get at you through the garment.
    [{ gear: { armor: 1, name: 'Enchanted Clothing' } }]

    # Mobility: You have a truck, van, or car built for
    # monster hunting. Choose two good things and one
    # bad thing about it.
    # Good things: roomy; surveillance gear; fast;
    # stealthy; intimidating; classic; medical kit; sleeping space; toolkit; concealed weapons; anonymous;
    # armoured (+1 armour inside); tough; monster cage.
    # Bad things: loud; obvious; temperamental; beaten-up; gas-guzzler; uncomfortable; slow; old.

    [gear: { redirect: gears_url }]
    # direct the user to a create gear page

    # options: [{class: {attributes}}] jsonb col

    # hunters_move - available: bool
  end
end
