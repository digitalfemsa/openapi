merge:
	docker run --rm \
	-v ${PWD}:/local openapitools/openapi-generator-cli:v7.6.0 generate \
	-g openapi-yaml \
	-i /local/api.yaml \
	-p outputFile=local/_build/api.yaml \
	--skip-validate-spec

update-readme:
	make merge && rdme openapi _build/api.yaml --version=v1.0.0  --key=${README_API_KEY}
