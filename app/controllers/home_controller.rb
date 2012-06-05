class HomeController < ApplicationController
  skip_before_filter :switch_label, only: :labels

  expose(:current_event) { Event.current.first }
  expose(:events) { Event.latest }
  expose(:people) { User.ordered }
  expose(:wishes_undone) { Wish.undone }
  expose(:wishes_done) { Wish.done }
  expose(:organizers) { User.organizer }
  expose(:locations) { Location.cometogether }
  expose(:companies) { Location.company }

  def labels
    render :layout => 'labels'
  end
end
