# Not using this currently, as I am using carrierwave

# class Avatar
#   include Mongoid::Document
#   include Mongoid::Paperclip

#   embedded_in :user, inverse_of: :avatar

#   has_mongoid_attached_file :attachment,
#     # path:            ':attachment/:id/:style.:extension',
#     storage:         :s3,
#     # url:             ':s3_alias_url',
#     # s3_host_alias:   'something.cloudfront.net',
#     s3_credentials:
#       :bucket => "brian-paperclip",
#       :access_key_id => "",
#       :secret_access_key => "",
#       :s3_host_name => 's3-ap-southeast-1.amazonaws.com'
#     styles:  {
#       original:  ['1920x1680>', :jpg],
#       small:  ['100x100#',   :jpg],
#       medium:  ['250x250',    :jpg],
#       large:  ['500x500>',   :jpg]
#     },
#     :convert_options => { all: '-background white -flatten +matte' }
# end

# @user.avatar.each do |m|
#   m.attachment.url
# end