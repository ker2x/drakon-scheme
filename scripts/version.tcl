
proc application_version { } {
	return 14
}

proc application_start_version { } {
	return 1
}

proc version_string { } {
	return "[application_start_version].[application_version]"
}
