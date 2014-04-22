class VoteMailer < ActionMailer::Base
  default from: "no-reply@redditclone.com"

  def notification(vote, post)
    @vote = vote
    @post = post
    @user = @post.user

    mail(to: @user.email, subject: 'Your post got voted for')
  end
end
