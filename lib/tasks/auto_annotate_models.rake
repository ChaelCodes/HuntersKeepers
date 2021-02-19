# frozen_string_literal: true

# NOTE: only doing this in development as some production environments (Heroku)
# NOTE: are sensitive to local FS writes, and besides -- it's just not proper
# NOTE: to have a dev-mode tool do its thing in production.

if Rails.env.development?
  require 'annotate'
  task :set_annotation_options do
    # You can override any of these by setting an environment variable of the
    # same name.

    annotate_config = {}
    annotate_config['active_admin'] = 'false'
    annotate_config['additional_file_patterns'] = []
    annotate_config['routes'] = 'false'
    annotate_config['models'] = 'true'
    annotate_config['position_in_routes'] = 'before'
    annotate_config['position_in_class'] = 'before'
    annotate_config['position_in_test'] = 'before'
    annotate_config['position_in_fixture'] = 'before'
    annotate_config['position_in_factory'] = 'before'
    annotate_config['position_in_serializer'] = 'before'
    annotate_config['show_foreign_keys'] = 'true'
    annotate_config['show_complete_foreign_keys'] = 'false'
    annotate_config['show_indexes'] = 'true'
    annotate_config['simple_indexes'] = 'false'
    annotate_config['model_dir'] = 'app/models'
    annotate_config['root_dir'] = ''
    annotate_config['include_version'] = 'false'
    annotate_config['require'] = ''
    annotate_config['exclude_tests'] = 'false'
    annotate_config['exclude_fixtures'] = 'false'
    annotate_config['exclude_factories'] = 'false'
    annotate_config['exclude_serializers'] = 'false'
    annotate_config['exclude_scaffolds'] = 'true'
    annotate_config['exclude_controllers'] = 'true'
    annotate_config['exclude_helpers'] = 'true'
    annotate_config['exclude_sti_subclasses'] = 'false'
    annotate_config['ignore_model_sub_dir'] = 'false'
    annotate_config['ignore_columns'] = nil
    annotate_config['ignore_routes'] = nil
    annotate_config['ignore_unknown_models'] = 'false'
    annotate_config['hide_limit_column_types'] = 'integer,bigint,boolean'
    annotate_config['hide_default_column_types'] = 'json,jsonb,hstore'
    annotate_config['skip_on_db_migrate'] = 'false'
    annotate_config['format_bare'] = 'false'
    annotate_config['format_rdoc'] = 'false'
    annotate_config['format_yard'] = 'true'
    annotate_config['format_markdown'] = 'false'
    annotate_config['sort'] = 'false'
    annotate_config['force'] = 'false'
    annotate_config['frozen'] = 'false'
    annotate_config['classified_sort'] = 'true'
    annotate_config['trace'] = 'false'
    annotate_config['wrapper_open'] = nil
    annotate_config['wrapper_close'] = nil
    annotate_config['with_comment'] = 'true'
    Annotate.set_defaults(
      annotate_config
    )
  end

  Annotate.load_tasks
end
