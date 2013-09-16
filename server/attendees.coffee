Meteor.methods
	clearAttendees: ->
		if Meteor.user().emails[0].address == 'dave@neo.com'
			Meteor.Attendees.remove {}
	addAttendee: ->
		me = Meteor.user().emails[0].address
		if Meteor.Attendees.find({ email: me }).count() == 0
			Meteor.Attendees.insert { email : me }