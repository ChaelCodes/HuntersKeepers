# frozen_string_literal: true

# Application Helper
module ApplicationHelper
  def show_page_buttons(object, rel = nil)
    tag.div(class: 'field has-addons') do
      safe_join(p_wrap(page_buttons(object, rel)))
    end
  end

  def p_wrap(control_tags)
    control_tags.map do |control_tag|
      tag.p(class: 'control') { control_tag }
    end
  end

  def page_buttons(object, rel)
    buttons = []
    buttons << edit_button(object, rel) if policy(object).edit?
    buttons << index_button(object, rel)
    buttons << destroy_button(object, rel) if policy(object).destroy?
    buttons
  end

  def destroy_button(object, rel)
    link_to(t('.destroy'),
            [rel, object],
            method: :delete,
            class: 'button',
            data: { confirm: t('.confirm_destroy') })
  end

  def edit_button(object, rel)
    link_to(t('.edit'), [:edit, rel, object], class: 'button')
  end

  def index_button(object, rel)
    link_to(t('.index'), [rel, object.class], class: 'button')
  end
end
