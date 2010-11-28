postOffice := Object clone
postOffice packageSender := method(call sender)

mailer := Object clone
mailer deliver := method(postOffice packageSender)
mailer deliver

