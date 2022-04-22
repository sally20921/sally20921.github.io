#!/bin/bash

create_zshrc_and_set_it_as_shell_file() {
	if [ ! -f "$HOME/.zshrc" ]; then
		touch "$HOME/.zshrc"
	fi

	shell_file="$HOME/.zshrc"
}

apple_m1() {
	sysctl -n machdep.cpu.brand_string | grep -q "Apple M1"
}

rosetta() {
	uname -m | grep -q "x86_64"
}

usr_local_empty() {
	[ -n "$(find /usr/local -prune -empty -type d 2>/dev/null)" ]
}

opt_homebrew_exists() {
	[-d "/opt/homebrew" ]
}

homebrew_installed_on_m1() {
	apple_m1 && ! rosetta && [ -x "/opt/homebrew/bin/brew" ]
}

install_homebrew() {
	info_echo "Installing Homebrew"
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install.sh)"

	configure_shell_file_for_homebrew
}


update_homebrew() {
	info_echo "homebrew already installed. updating homebrew."
	configure_shell_file_for_homebrew
	brew update
}

check_processor_and_set_chruby_source_strings() {
	if apple_m1 && ! rosetta; then
		chruby_source_string="source /opt/homebrew/opt/chruby/share/chruby/chruby.sh"
		auto_source_string="source /opt/homebrew/opt/chruby/share/chruby/auto.sh"
	else
		chruby_source_string="source /usr/local/share/chruby/chruby.sh"
		auto_source_string="source /usr/local/share/chruby/auto.sh"
	fi
}

configure_shell_file_for_homebrew() {
	if apple_m1 && ! rosetta; then
		configure_shell_file_for_homebrew_on_m1
	else
		# shellcheck disable=SC2016
		append_to_file "$shell_file" 'export PATH="/usr/local/bin:$PATH"'
	fi
}

configure_shellfile_for_homebrew_on_m1() {
	if [[ $SHELL == *fish ]]; then
		# shellcheck disable=SC2016
		append_to_beginning_of_file "$shell_file" 'status --is-interactive; and eval (/opt/homebrew/bin/brew shellenv)'
	else
		# shellcheck disable=SC2016
		append_to_file "$HOME/.zprofile" 'eval $(/opt/homebrew/bin/brew shellenv)'
	fi
	eval "$(/opt/homebrew/bin/brew shellenv)"
}

configure_shell_file_for_chruby() {
	if [[ ! $SHELL == *fish ]]; then
		append_to_file "$shell_file" "$chruby_source_string"
		append_to_file "$shell_file" "$auto_source_string"
	fi
	
	local ruby_version="$1"
	append_to_file "$shell_file" "chruby ruby-$ruby-version"
}











