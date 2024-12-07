SHELL=/bin/zsh

.PHONY: nvim-archive
nvim-archive:
	sh nvim/install-dein.sh
	if [ ! -d ${HOME}/.config/nvim ]; then mkdir -p ${HOME}/.config/nvim; fi
	ln -s -f ${PWD}/nvim/coc-config.json ${HOME}/.config/nvim/coc-settings.json
	mkdir -p ${HOME}/.config/nvim/colors

.PHONY: nvim
nvim:
	if [ ! -d ${HOME}/.config/nvim ]; then mkdir -p ${HOME}/.config/nvim; fi
	mv ${HOME}/.config/nvim{,.bak} 
	ln -sf ${PWD}/nvim ${HOME}/.config/nvim

.PHONY:vim
vim:
	sh vim/install-dein.sh
	if [ ! -e ${HOME}/.vimrc ]; then ln -sf ${PWD}/vim/.vimrc ${HOME}/.vimrc; fi
	if [ ! -e ${HOME}/.vim ]; then cp -r ${PWD}/vim/.vim ${HOME}/.vim; fi
	
PHONY: zsh-conf
zsh-conf:

# Back up
	if [ -e ${HOME}/.zshenv ]; then cp ${HOME}/.zshenv ${HOME}/.zshenv.backup; fi
	if [ -e ${HOME}/.zshrc ]; then cp ${HOME}/.zshrc ${HOME}/.zshrc.backup; fi
	if [ -e ${HOME}/.zprofile ]; then cp ${HOME}/.zprofile ${HOME}/.zprofile.backup; fi
	if [ -e ${HOME}/.zshenv.local ]; then cp ${HOME}/.zshenv.local ${HOME}/.zshenv.local.backup; fi
	if [ -e ${HOME}/.zshrc.local ]; then cp ${HOME}/.zshrc.local ${HOME}/.zshrc.local.backup; fi
	if [ -e ${HOME}/.zprofile.local ]; then cp ${HOME}/.zprofile.local ${HOME}/.zprofile.local.backup; fi

 # Create .local if not exists
	if [ ! -e ${HOME}/.zshenv.local ]; then cp ${PWD}/zsh/.zshenv.local ${HOME}/.zshenv.local; fi
	if [ ! -e ${HOME}/.zshrc.local ]; then cp ${PWD}/zsh/.zshrc.local ${HOME}/.zshrc.local; fi
	if [ ! -e ${HOME}/.zprofile.local ]; then cp ${PWD}/zsh/.zprofile.local ${HOME}/.zprofile.local; fi

	ln -sf ${PWD}/zsh/.zshenv ${HOME}/.zshenv
	ln -sf ${PWD}/zsh/.zshrc ${HOME}/.zshrc
	ln -sf ${PWD}/zsh/.zprofile ${HOME}/.zprofile


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
