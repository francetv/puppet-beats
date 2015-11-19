# Setup the official repo
apt::source { 'elastic-beats':
	comment => 'Official Elastic beats repositories',
	location => 'https://packages.elastic.co/beats/apt',
	release => 'stable',
	repos => 'main',
	key => {
		id => '46095ACC8548582C1A2699A9D27D666CD88E42B4',
		server => 'pgp.mit.edu'
	},
	include => {
		'deb' => true
	}
}