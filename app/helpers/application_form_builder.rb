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

  def collection_select(method, collection, value_method, text_method, options = {}, html_options = {})
    tag.div class: 'select' do
      super(method, collection, value_method, text_method, options = {}, html_options = {})
    end
  end

  def number_field(method, options = {})
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
