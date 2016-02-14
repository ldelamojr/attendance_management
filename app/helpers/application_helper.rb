module ApplicationHelper
  def avatar_url(user) #gravatar
    # default_url = "https://pbs.twimg.com/profile_images/616323696601468930/SkNd2ppU.png?s=48"
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    "http://www.gravatar.com/avatar/#{gravatar_id}.png?s=48&d=http://challenges.s3.amazonaws.com/mta-app-quest/GA_logo.png"
  end
end
