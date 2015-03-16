module ApplicationHelper
  def number_to_won(number)
    number_to_currency number, unit: '원', precision: 0, format: '%n%u'
  end

  def facebook_image_tag_by_uid(uid, *args, &block)
    options = args.extract_options!
    url_options = options.slice(:width, :height)
    image_url = "//graph.facebook.com/#{uid}/picture?#{url_options.to_query}"
    image_tag image_url, options, &block
  end
end
