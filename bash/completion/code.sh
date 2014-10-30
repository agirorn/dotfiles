complete -C ~/.profile_scripts/code.sh -o default c

c() {
	cd ~/code/$1
}

safari() {
	if [ ! -e config/environment.rb ]; then
		open -aSafari
		return
	fi

  open -aSafari http://$(basename `pwd`).local
}
