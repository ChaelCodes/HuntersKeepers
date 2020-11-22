# frozen_string_literal: true

# This FormBuilder is the default for the application
# It'll use Bulma styling and build labelled form fields
# If you need a specific input not included here, please add it
class ApplicationFormBuilder < ActionView::Helpers::FormBuilder
  delegate :tag, to: :@template

  def labelled_check_box(method, *input_options, label_options: {})
    tag.div(class: 'field') do
      check_box(method, *input_options) +
        label(method, label_options)
    end
  end

  def labelled_collection_select(method, *input_options, label_options: {})
    form_controls(method, label_options) do
      collection_select(method, *input_options)
    end
  end

  def labelled_number_field(method, label_options: {}, input_options: {})
    form_controls(method, label_options) do
      number_field(method, input_options)
    end
  end

  def labelled_text_field(method, label_options: {}, input_options: {})
    form_controls(method, label_options) do
      text_field(method, input_options)
    end
  end

  def collection_select(*args)
    tag.div class: 'select' do
      super(*args)
    end
  end

  def email_field(method, options = {})
    super(method, options.merge(class: 'input'))
  end

  def number_field(method, options = {})
    super(method, options.merge(class: 'input'))
  end

  def password_field(method, options = {})
    super(method, options.merge(class: 'input'))
  end

  def text_field(method, options = {})
    super(method, options.merge(class: 'input'))
  end

  private

  def form_controls(method, label_options)
    tag.div(class: 'field') do
      label(method, label_options) +
        tag.div(class: 'control') do
          yield
        end
    end
  end
end
