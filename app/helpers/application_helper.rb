# frozen_string_literal: true

# Application Helper
module ApplicationHelper
  def show_page_buttons(object)
    tag.div(class: 'field has-addons') do
      safe_join(page_buttons(object).map { |button| tag.p(class: 'control') { button } })
    end
  end

  def page_buttons(object)
    buttons = []
    if policy(object).edit?
      buttons << link_to(t('.edit'), [:edit, object], class: 'button')
    end
    buttons << link_to(t('.index'), object.class, class: 'button')
    if policy(object).destroy?
      buttons << destroy_button(object)
    end
    buttons
  end

  def destroy_button(object)
    link_to(t('.destroy'), object, method: :delete, class: 'button', data: { confirm: t('.confirm_destroy') })
  end
end
