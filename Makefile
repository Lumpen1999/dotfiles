SHELL=/bin/zsh

.PHONY: nvim
nvim:
	sh nvim/install-dein.sh
	if [ ! -d ${HOME}/.config/nvim ]; then mkdir -p ${HOME}/.config/nvim; fi
	ln -s -f ${PWD}/nvim/coc-config.json ${HOME}/.config/nvim/coc-settings.json
	mkdir -p ${HOME}/.config/nvim/colors

.PHONY:vim
vim:
	sh vim/install-dein.sh
	if [ ! -e ${HOME}/.vimrc ]; then ln -sf ${PWD}/vim/.vimrc ${HOME}/.vimrc; fi
	if [ ! -e ${HOME}/.vim ]; then cp -r ${PWD}/vim/.vim ${HOME}/.vim; fi
	
PHONY: zsh-conf
zsh-conf:
	ln -sf ${PWD}/zsh/.zshenv ${HOME}/.zshenv
	ln -sf ${PWD}/zsh/.zshrc ${HOME}/.zshrc
	ln -sf ${PWD}/zsh/.zprofile ${HOME}/.zprofile
	if [ ! -e ${HOME}/.zshenv.local ]; then cp ${PWD}/zsh/.zshenv.local ${HOME}/.zshenv.local; fi
	if [ ! -e ${HOME}/.zshrc.local ]; then cp ${PWD}/zsh/.zshrc.local ${HOME}/.zshrc.local; fi
	if [ ! -e ${HOME}/.zprofile.local ]; then cp ${PWD}/zsh/.zprofile.local ${HOME}/.zprofile.local; fi

.PHONY: zsh-plugin
zsh-plugin: 
	sh ${PWD}/zsh/install-plugin.sh

.PHONY: zsh
zsh: zsh-plugin zsh-conf

.PHONY: pre
pre:
	if [ ! -d /usr/local/bin ]; then sudo mkdir -p /usr/local/bin; fi

.PHONY: conf 
conf: zsh_conf zsh-plugin 

.PHONY: all
all: pre nvim zsh 
