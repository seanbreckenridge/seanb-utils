.DEFAULT_GOAL := doctor

LOCAL_BIN="${HOME}/.local/bin"
HAVECMD_LOCAL="${CURDIR}/shellscripts/havecmd"

doctor: doctor-path deps-base check-lang
	@echo doctor: done ✓

install: doctor-path deps-base install-shellscripts check-lang python-install golang-install cargo-install
	@echo install: done ✓

doctor-path:
	@"${CURDIR}/installer/check-path" $(LOCAL_BIN)

deps-base:
	@# actual coreutils, just check a few that might be needed
	@$(HAVECMD_LOCAL) -v mktemp
	@$(HAVECMD_LOCAL) -v cut
	@$(HAVECMD_LOCAL) -v tr
	@$(HAVECMD_LOCAL) -v uniq
	@$(HAVECMD_LOCAL) -v comm
	@$(HAVECMD_LOCAL) -v du
	@# other core tools that should be installed
	@$(HAVECMD_LOCAL) -v curl
	@$(HAVECMD_LOCAL) -v wget
	@$(HAVECMD_LOCAL) -v realpath
	@$(HAVECMD_LOCAL) -v awk
	@$(HAVECMD_LOCAL) -v sed
	@$(HAVECMD_LOCAL) -v find
	@$(HAVECMD_LOCAL) -v grep
	@# more opinionated stuff thats used in lots of scripts here
	@$(HAVECMD_LOCAL) -V 'optional/recommended install' rsync || true
	@$(HAVECMD_LOCAL) -V 'optional/recommended install; See https://github.com/BurntSushi/ripgrep#installation' rg || true
	@$(HAVECMD_LOCAL) -V 'optional/recommended install; See https://github.com/sharkdp/fd#installation' fd || true
	@$(HAVECMD_LOCAL) -V 'optional/recommended install; See https://github.com/bootandy/dust#install' dust || true
	@$(HAVECMD_LOCAL) -V 'optional/recommended install; See https://github.com/junegunn/fzf#installation' fzf || true
	@echo deps-base: done ✓

check-lang:
	@echo 'check-lang: Checking for languages...'
	@if $(HAVECMD_LOCAL) -v python3; then echo check-lang: python3 ✓; fi || true
	@if $(HAVECMD_LOCAL) -v go; then echo check-lang: go ✓; fi || true
	@if $(HAVECMD_LOCAL) -v cargo; then echo check-lang: cargo ✓; fi || true
	@echo check-lang: done ✓

python-install:
	@if "${CURDIR}/installer/python-installs"; then echo python-installs: done ✓; fi || true

golang-install:
	@if "${CURDIR}/installer/golang-installs"; then echo golang-installs: done ✓; fi || true

cargo-install:
	@if "${CURDIR}/installer/cargo-installs"; then echo cargo-installs: done ✓; fi || true

install-shellscripts:
	@echo install-shellscripts: Installing...
	find "${CURDIR}/shellscripts" -type f -executable -exec cp -vt $(LOCAL_BIN) '{}' +
	@echo install-shellscripts: done ✓
