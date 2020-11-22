class ApplicationFormBuilder < ActionView::Helpers::FormBuilder
  delegate :tag, to: :@template

  def labelled_text_field(method, label_options: {}, input_options: {})
    tag.div(class: 'field') do
      label(method, label_options) +
      tag.div(class: 'control') do
        text_field(method, input_options)
      end
    end
  end

  def labelled_collection_select(method, label_options: {}, input_options: {})
    tag.div(class: 'field') do
      label(method, label_options) +
      tag.div(class: 'control') do
        # 😳 @object.association(method.to_s.sub(/_id$/, '')).klass.all
        collection_select(method,
          input_options[:collection], 
          input_options[:value_method] || :id,
          input_options[:text_method] || :to_s,
          input_options[:options],
          input_options[:html_options])
      end
    end
  end

  def collection_select(method, collection, value_method, text_method, options = {}, html_options = {})
    tag.div class: 'select' do
      super(method, collection, value_method, text_method, options = {}, html_options = {})
    end
  end

  def text_field(method, options = {})
    super(method, options.merge(class: 'input'))
  end
end
