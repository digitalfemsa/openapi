API_README_VERSION_ID = xxxxxx
merge:
	docker run --rm \
	-v ${PWD}:/local openapitools/openapi-generator-cli:v7.2.0 generate \
	-g openapi-yaml \
	-i /local/api.yaml \
	-p outputFile=local/_build/api.yaml \
	--skip-validate-spec

update-readme:
	make merge && rdme openapi _build/api.yaml --id=$(API_README_VERSION_ID)  --key=${README_API_KEY}
