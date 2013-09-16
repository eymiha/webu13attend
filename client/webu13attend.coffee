Template.attendees.attendees = -> Meteor.Attendees.find {}, {sort: {email: 1}}

Template.attendee.helpers
  me: ->
  	me = Meteor.user().emails[0].address
  	if @.email == me
  		"me"
  	else
  		"another"

Template.logout.events
	'click .logout': -> Meteor.logout()

Template.gateway.events
	'click .gateway': -> Meteor.call('clearAttendees')

Deps.autorun ->
	if Meteor.user()
		Meteor.call('addAttendee')
