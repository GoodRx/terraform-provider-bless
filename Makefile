build_all: packr
	@CGO_ENABLED=0 go build -o terraform-provider-bless_v1.0.0_darwin
	@CGO_ENABLED=0 GOOS=linux go build -o terraform-provider-bless_v1.0.0_linux
	@CGO_ENABLED=0 GOOS=windows go build -o terraform-provider-bless_v1.0.0_windows

test: packr
	@TF_ACC=yes go test -cover -v ./...

packr: clean
	packr

clean: ## clean the repo
	rm terraform-provider-bless 2>/dev/null || true
	go clean
	rm -rf dist 2>/dev/null || true
	packr clean
	rm coverage.out 2>/dev/null || true


release: ## run a release
	bff bump
	git push
	goreleaser release --rm-dist

.PHONY: build test packr release
