extends SuspectTemplate
class_name Suspect5

func stake():
	is_vampire = true
	get_parent().get_parent().robert_alive = false
	super.stake()
