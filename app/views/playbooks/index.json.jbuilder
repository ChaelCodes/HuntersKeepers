# frozen_string_literal: true

json.array! @playbooks, partial: 'playbooks/playbook', as: :playbook
