setup:
	xcodegen generate
	pod install  --repo-update

.PHONY: setup