module EventsHelper
  def participation_link
    if signed_in?
      if current_user.participates?(event)
        button_to t("show.not_attend"), event_participant_path(event, current_user.participation(event)), class: 'button', method: 'delete'
      else
        button_to t("show.attend"), add_user_event_path(event), class: 'button'
      end
    end
  end

  def event_with_tooltip(event)
    content_tag(:h2, event.name) +
    content_tag(:p, event.description) +
    content_tag(:ul, '', class: 'enumeration') do
      event.topics.map do |topic|
        content_tag :li, topic.name
      end.join.html_safe
    end
  end
end
