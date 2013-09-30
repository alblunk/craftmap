# https://devcenter.heroku.com/articles/paperclip-s3
# seems this is for overriding settings, and international stuff
Paperclip::Attachment.default_options[:url] = ':s3_domain_url'
Paperclip::Attachment.default_options[:path] = '/:class/:attachment/:id_partition/:style/:filename'