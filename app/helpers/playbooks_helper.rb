# frozen_string_literal: true

# Playbooks Helper
module PlaybooksHelper
  def link_to_playbook(obj)
    obj.playbook ? link_to(obj.playbook.name, obj.playbook) : ''
  end

  def select_playbook(form)
    tag.div class: 'select' do
      form.collection_select :playbook_id, Playbook.all, :id, :name
    end
  end
end
