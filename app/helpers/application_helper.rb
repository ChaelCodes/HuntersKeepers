# frozen_string_literal: true

# Application Helper
module ApplicationHelper
  def show_page_buttons(object)
    tag.div(class: 'field has-addons') do
      safe_join(p_wrap(page_buttons(object)))
    end
  end

  def p_wrap(control_tags)
    control_tags.map do |control_tags|
      tag.p(class: 'control') { control_tags }
    end
  end

  def page_buttons(object)
    buttons = []
    buttons << edit_button(object) if policy(object).edit?
    buttons << index_button(object)
    buttons << destroy_button(object) if policy(object).destroy?
    buttons
  end

  def destroy_button(object)
    link_to(t('.destroy'),
            object,
            method: :delete,
            class: 'button',
            data: { confirm: t('.confirm_destroy') })
  end

  def edit_button(object)
    link_to(t('.edit'), [:edit, object], class: 'button')
  end

  def index_button(object)
    link_to(t('.index'), object.class, class: 'button')
  end
end
