Refinery::UserMailer.class_eval do

  def reset_notification(user, request)
    @user = user
    @url = refinery.edit_refinery_user_password_url({
                                                        :host => request.host_with_port,
                                                        :reset_password_token => @user.reset_password_token
                                                    })

    mail(:to => user.email,
         :subject => t('subject', :scope => 'refinery.user_mailer.reset_notification'),
         :from => 'no-reply@unep-wcmc.org')
  end

end