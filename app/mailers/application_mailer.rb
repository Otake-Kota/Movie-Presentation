class ApplicationMailer < ActionMailer::Base
  default from: 'moviepresentation@moviepresentation.com', charset: 'ISO-2022-JP'
  layout 'mailer'
end
