# frozen_string_literal: true

json.partial! 'improvements/improvement', improvement: @improvement
json.improvable_options @improvable_options if @improvable_options
