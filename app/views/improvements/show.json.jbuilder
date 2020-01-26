# frozen_string_literal: true

json.partial! 'improvements/improvement', improvement: @improvement
if @improvable_options
  json.improvable_options @improvable_options
end
