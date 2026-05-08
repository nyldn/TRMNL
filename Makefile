.PHONY: validate new preview export

validate:
	./scripts/validate-recipe.sh

new:
	@test -n "$(NAME)" || (echo "Usage: make new NAME=my-recipe" >&2; exit 1)
	./scripts/new-recipe.sh "$(NAME)"

preview:
	@test -n "$(RECIPE)" || (echo "Usage: make preview RECIPE=recipes/my-recipe" >&2; exit 1)
	./scripts/preview-recipe.sh "$(RECIPE)"

export:
	@test -n "$(RECIPE)" || (echo "Usage: make export RECIPE=recipes/my-recipe" >&2; exit 1)
	./scripts/export-recipe.sh "$(RECIPE)"

