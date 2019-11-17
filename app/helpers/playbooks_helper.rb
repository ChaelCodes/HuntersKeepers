# frozen_string_literal: true

# Playbooks Helper
module PlaybooksHelper
  def link_to_playbook(obj)
    obj.playbook ? link_to(obj.playbook.name, obj.playbook) : ''
  end
end
