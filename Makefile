.PHONY: xxx
xxx:
	@echo "Please select optimal option."

# To lint, find all shellscript files(*.sh) from project, then pass it shellcheck
lint:
	find . -type f \( -name '*.sh' \) ! -path '*/.editorconfig.d/*' -a ! -path '*/.git/*' | xargs shellcheck -f gcc
