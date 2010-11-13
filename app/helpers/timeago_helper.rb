module TimeagoHelper
  def timeago(time, options = {})
    options.assert_valid_keys :class, :format, :default
    options[:class] ||= "timeago"
    datetime = case
    when time.nil?
      return options[:default]
    when time.is_a?(Date)
      time.to_date.strftime '%Y-%m-%d'
    else
      time.utc.strftime '%Y-%m-%dT%H:%M:%SZ'
    end
    options.reverse_merge! :datetime => datetime
    text = if format = options.delete(:format)
      if format.is_a? Symbol
        time.to_s format
      else
        time.strftime format
      end
    else
      time.to_s
    end
    content_tag(:time, text, options) if time
  end
end
