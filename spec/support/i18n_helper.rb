def human_attr(model, attr)
  I18n
    .t("activerecord.attributes.#{model.model_name.to_s.downcase}.#{attr.to_s}")
end
