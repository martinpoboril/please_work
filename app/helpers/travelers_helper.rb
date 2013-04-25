module TravelersHelper

	# Returns the Gravatar (http://gravatar.com/) for the given user.
  def gravatar_for(traveler, options = { size: 52 })
    gravatar_id = Digest::MD5::hexdigest(traveler.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: traveler.last_name, class: "gravatar")
  end
end
